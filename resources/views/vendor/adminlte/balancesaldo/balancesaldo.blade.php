@extends('adminlte::layouts.app')

@section('main-content')
<?php
    // Formatea un importe con su simbolo; negativos en rojo
    $f = function ($n, $sym) {
        $color = ($n < 0) ? '#c0392b' : '#111';
        return '<span style="color:' . $color . '">' . $sym . number_format($n, 2, ',', '.') . '</span>';
    };
?>

<style>
    .bs-table th, .bs-table td { text-align:right; white-space:nowrap; }
    .bs-table th:first-child, .bs-table td:first-child { text-align:left; }
    .bs-usd { background-color:#f0f8f2; }
    .bs-acum { background-color:#f4f8fb; }
</style>

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
            <table class="table table-striped table-bordered bs-table">
                <thead>
                    <tr style="background-color:#c6e0ec;">
                        <th rowspan="2">Mes</th>
                        <th colspan="2">Ingresos</th>
                        <th colspan="2">Egresos</th>
                        <th colspan="2">Resultado</th>
                        <th colspan="2">Saldo acumulado</th>
                    </tr>
                    <tr style="background-color:#dceaf1;">
                        <th>Pesos</th><th class="bs-usd">USD</th>
                        <th>Pesos</th><th class="bs-usd">USD</th>
                        <th>Pesos</th><th class="bs-usd">USD</th>
                        <th>Pesos</th><th class="bs-usd">USD</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($monthly as $row)
                    <tr>
                        <td>{{ $row['mes'] }}</td>
                        <td>{!! $f($row['ingA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($row['ingU'], 'USD ') !!}</td>
                        <td>{!! $f($row['egrA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($row['egrU'], 'USD ') !!}</td>
                        <td>{!! $f($row['resA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($row['resU'], 'USD ') !!}</td>
                        <td class="bs-acum">{!! $f($row['acumA'], '$') !!}</td>
                        <td class="bs-acum">{!! $f($row['acumU'], 'USD ') !!}</td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr style="background-color:#c6e0ec; font-weight:bold;">
                        <td>Total {{ $yearSelected }}</td>
                        <td>{!! $f($yearTotal['ingA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($yearTotal['ingU'], 'USD ') !!}</td>
                        <td>{!! $f($yearTotal['egrA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($yearTotal['egrU'], 'USD ') !!}</td>
                        <td>{!! $f($yearTotal['resA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($yearTotal['resU'], 'USD ') !!}</td>
                        <td>{!! $f($yearTotal['acumA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($yearTotal['acumU'], 'USD ') !!}</td>
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
            <table class="table table-striped table-bordered bs-table">
                <thead>
                    <tr style="background-color:#c6e0ec;">
                        <th rowspan="2">Año</th>
                        <th colspan="2">Ingresos</th>
                        <th colspan="2">Egresos</th>
                        <th colspan="2">Resultado</th>
                        <th colspan="2">Saldo acumulado</th>
                    </tr>
                    <tr style="background-color:#dceaf1;">
                        <th>Pesos</th><th class="bs-usd">USD</th>
                        <th>Pesos</th><th class="bs-usd">USD</th>
                        <th>Pesos</th><th class="bs-usd">USD</th>
                        <th>Pesos</th><th class="bs-usd">USD</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($annual as $row)
                    <tr>
                        <td>{{ $row['year'] }}</td>
                        <td>{!! $f($row['ingA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($row['ingU'], 'USD ') !!}</td>
                        <td>{!! $f($row['egrA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($row['egrU'], 'USD ') !!}</td>
                        <td>{!! $f($row['resA'], '$') !!}</td>
                        <td class="bs-usd">{!! $f($row['resU'], 'USD ') !!}</td>
                        <td class="bs-acum">{!! $f($row['acumA'], '$') !!}</td>
                        <td class="bs-acum">{!! $f($row['acumU'], 'USD ') !!}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

</div>

@endsection
