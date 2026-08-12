@extends('adminlte::layouts.app')




@section('main-content')

	<div class="container-fluid spark-screen">
		<div class="row">
			<div class="col-md-12 ">
				<div class="box-body">
					<div class="container-fluid spark-screen" ng-controller="listusersController">
						<div class="row">
							<div class="col-md-12">
								<div class="box box-admin-border">
									<div class="box-header with-border">
										<i class="fa fa-bank"></i><h3 class="box-title"><b>Cuentas</b></h3>
									 	
									 	<a class="btn btn-primary " style="float: right;" href="{{ url('/account/create')}}"><i class="fa fa-plus"></i> Nuevo </a>
									</div>
									
									<div class="box-body responsive-table">

										<div id="lista_item_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
											<div class="row">
												<div class="col-sm-12">
													<table id="accounts" class="display" cellspacing="0" width="100%">
												        <thead>
												            <tr>
												                	<th>Id</th>
																	<th>Nombre</th>
																	<th>Numero de cuenta</th>
																	<th>Tipo</th>
																	<th>Moneda</th>
																	<th>Estado</th>
																	<th>Acción</th>
												            </tr>
												        </thead>
												      
												        <tbody>
												        	 @foreach ($account as $accounts)
															    <tr @if(isset($accounts->active) && !$accounts->active) style="opacity:0.55;" @endif>
															    	<td>{{ $accounts->id }}</td>
															    	<td>{{ $accounts->name }}</td>
															    	<td>{{ $accounts->number }}</td>
															    	<td>{{ $accounts->type }}</td>
												    	<td>{{ isset($accounts->currency) ? $accounts->currency : 'ARS' }}</td>
															        <td>
															        	@if(isset($accounts->active) && !$accounts->active)
															        		<span class="label label-default">Inactiva</span>
															        	@else
															        		<span class="label label-success">Activa</span>
															        	@endif
															        </td>
															        <td>
																	
														            <form role="form" action = "{{ url('/account/eliminar')}}/{{ $accounts->id }}" method="post"  enctype="multipart/form-data">
														                {{method_field('DELETE')}}
														                {{ csrf_field() }}

														            <a class="btn btn-sm btn-default"  href="{{ url('/account/detalle')}}/{{ $accounts->id }}"><i class="fa fa fa-eye"></i></a>
														            <a class="btn btn-sm btn-default" href="{{ url('/account/edit')}}/{{ $accounts->id }}"><i class="fa fa-edit"></i></a>
														            @if(isset($accounts->active) && !$accounts->active)
														            	<a class="btn btn-sm btn-success" title="Reactivar cuenta" href="{{ url('/account/toggle')}}/{{ $accounts->id }}"><i class="fa fa-check"></i></a>
														            @else
														            	<a class="btn btn-sm btn-warning" title="Desactivar cuenta" onclick="return confirm('¿Desactivar esta cuenta? Dejará de aparecer en los listados, pero se conserva su historial.');" href="{{ url('/account/toggle')}}/{{ $accounts->id }}"><i class="fa fa-ban"></i></a>
														            @endif
														            <button onclick='if(confirmDel() == false){return false;}' class="btn btn-sm btn-default" type="submit"><i class="fa fa-trash"></i></button></a>
														          </form>

															        </td>
															    </tr>
															    @endforeach
												        </tbody>     
													</table>
												</div>
											</div>
										</div>
										<!-- /.box-body -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	



@endsection
