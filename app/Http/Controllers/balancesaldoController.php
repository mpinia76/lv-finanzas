<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\summary;
use App\account;
use App\settings;
use Auth;

class balancesaldoController extends Controller
{
    public function index(Request $request)
    {
        $r = (new summaryController)->pass($act='saldo');
        if ($r > 0) {

            $usd  = settings::where('name', 'cotizacion_usd')->first();
            $rate = $usd ? floatval(str_replace(',', '.', $usd->value)) : 1;

            // Mapa cuenta -> moneda
            $curById = array();
            foreach (account::all() as $a) {
                $curById[$a->id] = isset($a->currency) ? $a->currency : 'ARS';
            }

            // Agrupar movimientos realizados por anio-mes y por anio (convertidos a pesos)
            $movs = summary::where('future', '=', 1)->get();
            $byYM = array();   // 'Y-m' => ['add'=>x,'out'=>y]
            $byY  = array();   // 'Y'   => ['add'=>x,'out'=>y]
            $yearsSet = array();
            foreach ($movs as $m) {
                if (!$m->created_at) continue;
                $ts = strtotime($m->created_at);
                $ym = date('Y-m', $ts);
                $y  = date('Y', $ts);
                $factor = (isset($curById[$m->account_id]) && $curById[$m->account_id] == 'USD') ? $rate : 1;
                $amt = $m->amount * $factor;
                if (!isset($byYM[$ym])) $byYM[$ym] = array('add' => 0, 'out' => 0);
                if (!isset($byY[$y]))   $byY[$y]   = array('add' => 0, 'out' => 0);
                if ($m->type == 'out') { $byYM[$ym]['out'] += $amt; $byY[$y]['out'] += $amt; }
                else                   { $byYM[$ym]['add'] += $amt; $byY[$y]['add'] += $amt; }
                $yearsSet[$y] = true;
            }

            // Rango de anios
            $years = array_keys($yearsSet);
            sort($years);
            $currentYear = (int)date('Y');
            $minYear = empty($years) ? $currentYear : (int)$years[0];
            $maxYear = max($currentYear, empty($years) ? $currentYear : (int)end($years));

            // Anio seleccionado
            $yearSelected = (int)$request->input('year');
            if (!$yearSelected) $yearSelected = $currentYear;

            // Acumulado antes del anio seleccionado
            $acum = 0;
            foreach ($byYM as $ym => $v) {
                if ((int)substr($ym, 0, 4) < $yearSelected) {
                    $acum += $v['add'] - $v['out'];
                }
            }

            // Tabla mensual del anio seleccionado
            $meses = array(1=>'Enero','Febrero','Marzo','Abril','Mayo','Junio',
                           'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
            $monthly = array();
            $totIng = 0; $totEgr = 0;
            for ($mo = 1; $mo <= 12; $mo++) {
                $key = $yearSelected . '-' . str_pad($mo, 2, '0', STR_PAD_LEFT);
                $ing = isset($byYM[$key]) ? $byYM[$key]['add'] : 0;
                $egr = isset($byYM[$key]) ? $byYM[$key]['out'] : 0;
                $res = $ing - $egr;
                $acum += $res;
                $monthly[] = array('mes' => $meses[$mo], 'ingresos' => $ing, 'egresos' => $egr,
                                   'resultado' => $res, 'acumulado' => $acum);
                $totIng += $ing; $totEgr += $egr;
            }
            $yearTotal = array('ingresos' => $totIng, 'egresos' => $totEgr,
                               'resultado' => $totIng - $totEgr, 'acumulado' => $acum);

            // Tabla anual comparativa (acumulado a fin de cada anio)
            $annual = array();
            $acumY = 0;
            for ($y = $minYear; $y <= $maxYear; $y++) {
                $ing = isset($byY[(string)$y]) ? $byY[(string)$y]['add'] : 0;
                $egr = isset($byY[(string)$y]) ? $byY[(string)$y]['out'] : 0;
                $res = $ing - $egr;
                $acumY += $res;
                $annual[] = array('year' => $y, 'ingresos' => $ing, 'egresos' => $egr,
                                  'resultado' => $res, 'acumulado' => $acumY);
            }

            return view('vendor.adminlte.balancesaldo.balancesaldo', [
                'rate'         => $rate,
                'monthly'      => $monthly,
                'yearTotal'    => $yearTotal,
                'annual'       => $annual,
                'yearSelected' => $yearSelected,
                'years'        => range($minYear, $maxYear),
            ]);

        } else {
            return view('vendor.adminlte.permission', ['summary' => null]);
        }
    }
}
