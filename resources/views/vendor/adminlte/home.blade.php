@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<div class="container-fluid spark-screen">

		<!-- Patrimonio total en las dos monedas -->
		<div class="row">
			<div class="col-md-6 col-xs-12">
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3>{{$divisa->value}}{{ number_format($totalfinal, 2, ',', '.') }}</h3>
						<p>Patrimonio total en pesos</p>
					</div>
					<div class="icon"><i class="fa fa-money"></i></div>
				</div>
			</div>
			<div class="col-md-6 col-xs-12">
				<div class="small-box bg-green">
					<div class="inner">
						<h3>USD {{ number_format($totalfinalUsd, 2, ',', '.') }}</h3>
						<p>Patrimonio total en dólares</p>
					</div>
					<div class="icon"><i class="fa fa-usd"></i></div>
				</div>
			</div>
		</div>

		<!-- Subtotales reales por moneda + accesos rápidos -->
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-blue"><i class="fa fa-university"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">Cuentas en pesos</span>
						<span class="info-box-number">{{$divisa->value}}{{ number_format($totalArs, 2, ',', '.') }}</span>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-green"><i class="fa fa-dollar"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">Cuentas en dólares</span>
						<span class="info-box-number">USD {{ number_format($totalUsd, 2, ',', '.') }}</span>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-aqua"><i class="fa fa-plus"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">Entradas</span>
						</br>
						<a href="{{ url('/summary/create?type=add')}}">Añadir depósito</a>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-yellow"><i class="fa fa-tag"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">Retiros</span>
						</br>
						<a href="{{ url('/summary/create?type=out')}}">Añadir retiro</a>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="container-fluid spark-screen">
		<div class="row">

			<!-- Saldo por cuenta -->
			<div class="col-md-6">
				<div class="box">
					<div class="box-header with-border">
						<i class="fa fa-credit-card"></i> <h3 class="box-title">Saldo por cuenta</h3>
					</div>
					<div class="box-body responsive-table">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Nombre</th>
									<th>Tipo</th>
									<th>Moneda</th>
									<th>Saldo</th>
								</tr>
							</thead>
							<tbody>
								@foreach ($summary as $summarys)
								<?php $cur = isset($summarys->currency) ? $summarys->currency : 'ARS'; ?>
								<tr>
									<td>{{ $summarys->name }}</td>
									<td>{{ $summarys->type }}</td>
									<td>{{ $cur }}</td>
									<td>
										@if($cur=='USD')
											USD {{ number_format($summarys->total, 2, ',', '.') }}
											<small class="text-muted">(≈ {{$divisa->value}}{{ number_format($summarys->total_ars, 2, ',', '.') }})</small>
										@else
											{{$divisa->value}}{{ number_format($summarys->total, 2, ',', '.') }}
										@endif
									</td>
								</tr>
								@endforeach
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- Últimos movimientos -->
			<div class="col-md-6">
				<div class="box">
					<div class="box-header with-border">
						<i class="fa fa-exchange"></i><h3 class="box-title">Últimos movimientos</h3>
					</div>
					<div class="box-body responsive-table">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Tipo</th>
									<th>Monto</th>
									<th>Cuenta</th>
									<th>Categoría</th>
								</tr>
							</thead>
							<tbody>
								@foreach ($account as $accounts)
								<tr>
									@if($accounts->type=="add")
									<td><span class="label bg-green">Ingreso</span></td>
									@else
									<td><span class="label bg-red">Salida</span></td>
									@endif
									<td>{{ number_format($accounts->amount, 2, ',', '.') }}</td>
									<td>{{ $accounts->name_account }}</td>
									<td>{{ $accounts->name_categories }}</td>
								</tr>
								@endforeach
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</div>

@endsection
