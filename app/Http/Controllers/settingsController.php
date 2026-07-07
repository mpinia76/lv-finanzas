<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\settings;
use Auth;

class settingsController extends Controller
{
    // Muestra el formulario con la cotización actual del dólar
    public function cotizacion()
    {
        $usd = settings::where('name', 'cotizacion_usd')->first();
        return view('vendor.adminlte.config.cotizacion', ['usd' => $usd]);
    }

    // Guarda el nuevo valor de la cotización
    public function guardarCotizacion(Request $request)
    {
        $this->validate($request, [
            'cotizacion' => 'required|numeric|min:0',
        ]);

        $usd = settings::where('name', 'cotizacion_usd')->first();
        if (!$usd) {
            $usd = new settings;
            $usd->name = 'cotizacion_usd';
        }
        // Guardamos siempre con punto como separador decimal
        $usd->value = str_replace(',', '.', $request->cotizacion);
        $usd->save();

        return redirect('config/cotizacion')->with('ok', 'Cotización actualizada');
    }
}
