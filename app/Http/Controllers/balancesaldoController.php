<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\summary;
use App\account;
use Auth;

class balancesaldoController extends Controller
{
    public function index(Request $request)
    {
        $r = (new summaryController)->pass($act='saldo');
        if ($r > 0) {

            // Mapa cuenta -> moneda (USD o ARS)
            $curById = array();
            foreach (account::all() as $a) {
                $curById[$a->id] = (isset($a->currency) && $a->currency == 'USD') ? 'USD' : 'ARS';
            }

            // Agrupar movimientos realizados por anio-mes y por anio, separando por moneda.
            // Claves: aA=ingresos ARS, oA=egresos ARS, aU=ingresos USD, oU=egresos USD
            $movs = summary::where('future', '=', 1)->get();
            $byYM = array();
            $byY  = array();
            $yearsSet = array();
            foreach ($movs as $m) {
                if (!$m->created_at) continue;
                // Excluir transferencias entre cuentas propias (no son ingreso ni egreso real)
                if (!empty($m->id_transfer) || $m->type == 'transfer') continue;
                $ts = strtotime($m->created_at);
                $ym = date('Y-m', $ts);
                $y  = date('Y', $ts);
                $isUsd = (isset($curById[$m->account_id]) && $curById[$m->account_id] == 'USD');
                $isOut = ($m->type == 'out');
                $amt   = (float)$m->amount;

                if (!isset($byYM[$ym])) $byYM[$ym] = array('aA'=>0,'oA'=>0,'aU'=>0,'oU'=>0);
                if (!isset($byY[$y]))   $byY[$y]   = array('aA'=>0,'oA'=>0,'aU'=>0,'oU'=>0);

                $k = ($isOut ? 'o' : 'a') . ($isUsd ? 'U' : 'A');
                $byYM[$ym][$k] += $amt;
                $byY[$y][$k]   += $amt;
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

            // Acumulado (por moneda) antes del anio seleccionado
            $acumA = 0; $acumU = 0;
            foreach ($byYM as $ym => $v) {
                if ((int)substr($ym, 0, 4) < $yearSelected) {
                    $acumA += $v['aA'] - $v['oA'];
                    $acumU += $v['aU'] - $v['oU'];
                }
            }

            // Tabla mensual del anio seleccionado
            $meses = array(1=>'Enero','Febrero','Marzo','Abril','Mayo','Junio',
                           'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
            $monthly = array();
            $tIngA=0; $tIngU=0; $tEgrA=0; $tEgrU=0;
            for ($mo = 1; $mo <= 12; $mo++) {
                $key = $yearSelected . '-' . str_pad($mo, 2, '0', STR_PAD_LEFT);
                $ingA = isset($byYM[$key]) ? $byYM[$key]['aA'] : 0;
                $ingU = isset($byYM[$key]) ? $byYM[$key]['aU'] : 0;
                $egrA = isset($byYM[$key]) ? $byYM[$key]['oA'] : 0;
                $egrU = isset($byYM[$key]) ? $byYM[$key]['oU'] : 0;
                $resA = $ingA - $egrA;
                $resU = $ingU - $egrU;
                $acumA += $resA;
                $acumU += $resU;
                $monthly[] = array('mes'=>$meses[$mo],
                    'ingA'=>$ingA,'ingU'=>$ingU,'egrA'=>$egrA,'egrU'=>$egrU,
                    'resA'=>$resA,'resU'=>$resU,'acumA'=>$acumA,'acumU'=>$acumU);
                $tIngA+=$ingA; $tIngU+=$ingU; $tEgrA+=$egrA; $tEgrU+=$egrU;
            }
            $yearTotal = array('ingA'=>$tIngA,'ingU'=>$tIngU,'egrA'=>$tEgrA,'egrU'=>$tEgrU,
                'resA'=>$tIngA-$tEgrA,'resU'=>$tIngU-$tEgrU,'acumA'=>$acumA,'acumU'=>$acumU);

            // Tabla anual comparativa (acumulado por moneda a fin de cada anio)
            $annual = array();
            $acA = 0; $acU = 0;
            for ($y = $minYear; $y <= $maxYear; $y++) {
                $ky = (string)$y;
                $ingA = isset($byY[$ky]) ? $byY[$ky]['aA'] : 0;
                $ingU = isset($byY[$ky]) ? $byY[$ky]['aU'] : 0;
                $egrA = isset($byY[$ky]) ? $byY[$ky]['oA'] : 0;
                $egrU = isset($byY[$ky]) ? $byY[$ky]['oU'] : 0;
                $resA = $ingA - $egrA;
                $resU = $ingU - $egrU;
                $acA += $resA;
                $acU += $resU;
                $annual[] = array('year'=>$y,
                    'ingA'=>$ingA,'ingU'=>$ingU,'egrA'=>$egrA,'egrU'=>$egrU,
                    'resA'=>$resA,'resU'=>$resU,'acumA'=>$acA,'acumU'=>$acU);
            }

            return view('vendor.adminlte.balancesaldo.balancesaldo', [
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
