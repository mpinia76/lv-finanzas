@extends('adminlte::layouts.app')

@section('main-content')

    <div class="box box-primary" style="max-width:520px;">
        <div class="box-header with-border">
            <i class="fa fa-usd"></i><h3 class="box-title">Cotización del dólar</h3>
        </div>

        @if(session('ok'))
            <div class="alert alert-success" style="margin:10px 15px 0;">
                {{ session('ok') }}
            </div>
        @endif

        @if($errors->any())
            <div class="alert alert-danger" style="margin:10px 15px 0;">
                {{ $errors->first() }}
            </div>
        @endif

        <!-- form start -->
        <form role="form" action="{{ url('/config/cotizacion') }}" method="post">
            {{ csrf_field() }}
            <div class="box-body">
                <div class="form-group">
                    <label for="cotizacion">Pesos por 1 USD</label>
                    <div class="input-group">
                        <span class="input-group-addon">$</span>
                        <input type="number" step="0.01" min="0" required
                               name="cotizacion" id="cotizacion" class="form-control"
                               value="{{ $usd ? $usd->value : '' }}"
                               placeholder="Ej: 1250">
                    </div>
                    <p class="help-block">
                        Este valor se usa para mostrar el equivalente en pesos de las cuentas en USD
                        (Belo, Payoneer, Mercado Pago USD, BNA y Cocos) y del Saldo Total.
                    </p>
                </div>
            </div>
            <div class="box-footer">
                <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
        </form>
    </div>

@endsection
