@extends('adminlte::layouts.app')

@section('main-content')
<?php
    // Formatea un monto en pesos mostrando debajo su equivalente en USD
    $fmt = function ($ars) use ($rate) {
        $usd = ($rate > 0) ? $ars / $rate : 0;
        $color = ($ars < 0) ? '#c0392b' : '#111';
        return '<span style="color:' . $color . '">$' . number_format($ars, 2, ',', '.')
             . '<br><small style="color:#888;">USD ' . number_format($usd, 2, ',', '.') . '</small></span>';
    };
?>

<div class="container-fluid spark-screen">

    <!-- Balance mensual del anio seleccionado -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <i class="fa fa-calendar"></i>
            <h3 class="box-title">Balance de Saldo — {{ $yearSelected }}</h3>

            <form method="get" action="{{ url('/balancesaldo/balancesaldo') }}" class="pull-right form-inline">
                <label>Año&nbsp;</label>
                <select name="year" class="form-control input-sm" onchange="this.form.submit()">
                    @foreach (array_reverse($years) as $y)
                        <option value="{{ $y }}" @if($y == $yearSelected) selected @endif>{{ $y }}</option>
                    @endforeach
                </select>
            </form>
        </div>

        <div class="box-body responsive-table">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr style="background-color:#c6e0ec;">
                        <th>Mes</th>
                        <th style="text-align:right;">Ingresos</th>
                        <th style="text-align:right;">Egresos</th>
                        <th style="text-align:right;">Resultado</th>
                        <th style="text-align:right;">Saldo acumulado</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($monthly as $row)
                    <tr>
                        <td>{{ $row['mes'] }}</td>
                        <td style="text-align:right;">{!! $fmt($row['ingresos']) !!}</td>
                        <td style="text-align:right;">{!! $fmt($row['egresos']) !!}</td>
                        <td style="text-align:right;">{!! $fmt($row['resultado']) !!}</td>
                        <td style="text-align:right; background-color:#f4f8fb;">{!! $fmt($row['acumulado']) !!}</td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr style="background-color:#c6e0ec; font-weight:bold;">
                        <td>Total {{ $yearSelected }}</td>
                        <td style="text-align:right;">{!! $fmt($yearTotal['ingresos']) !!}</td>
                        <td style="text-align:right;">{!! $fmt($yearTotal['egresos']) !!}</td>
                        <td style="text-align:right;">{!! $fmt($yearTotal['resultado']) !!}</td>
                        <td style="text-align:right;">{!! $fmt($yearTotal['acumulado']) !!}</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <!-- Comparativa anual -->
    <div class="box box-info">
        <div class="box-header with-border">
            <i class="fa fa-bar-chart"></i>
            <h3 class="box-title">Resumen anual</h3>
        </div>
        <div class="box-body responsive-table">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr style="background-color:#c6e0ec;">
                        <th>Año</th>
                        <th style="text-align:right;">Ingresos</th>
                        <th style="text-align:right;">Egresos</th>
                        <th style="text-align:right;">Resultado</th>
                        <th style="text-align:right;">Saldo acumulado</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($annual as $row)
                    <tr>
                        <td>{{ $row['year'] }}</td>
                        <td style="text-align:right;">{!! $fmt($row['ingresos']) !!}</td>
                        <td style="text-align:right;">{!! $fmt($row['egresos']) !!}</td>
                        <td style="text-align:right;">{!! $fmt($row['resultado']) !!}</td>
                        <td style="text-align:right; background-color:#f4f8fb;">{!! $fmt($row['acumulado']) !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

</div>

@endsection
