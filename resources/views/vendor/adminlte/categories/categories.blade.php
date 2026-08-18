@extends('adminlte::layouts.app')

@section('main-content')

  <div class="container-fluid spark-screen">
    <div class="row">
      <div class="col-md-12 ">
        <div class="box-body">
          <div class="container-fluid spark-screen">
            <div class="row">
              <div class="col-md-12">
                <div class="box box-admin-border">
                  <div class="box-header with-border">
                     <i class="fa fa-code-fork"></i><h3 class="box-title"><b>Categorias</b></h3>

                    <a class="btn btn-primary " style="float: right;" href="{{ url('/categories/create')}}{{ isset($ownerSelected) && $ownerSelected ? '?owner='.$ownerSelected : '' }}"> <i class="fa fa-plus"></i>Nuevo</a>
                  </div>

                  <div class="box-body" style="padding-bottom:0;">
                    <div class="btn-group" role="group">
                      <a class="btn {{ empty($ownerSelected) ? 'btn-primary' : 'btn-default' }}" href="{{ url('/categories/categories') }}">Todas</a>
                      @foreach((isset($owners) ? $owners : \App\categories::owners()) as $ownerKey => $ownerLabel)
                        <a class="btn {{ (isset($ownerSelected) && $ownerSelected == $ownerKey) ? 'btn-primary' : 'btn-default' }}" href="{{ url('/categories/categories') }}?owner={{ $ownerKey }}">{{ $ownerLabel }}</a>
                      @endforeach
                    </div>
                  </div>

                  <div class="box-body responsive-table">

                    <div id="lista_item_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                      <div class="row">
                        <div class="col-sm-12">
                          <table id="categories" class="display" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                      <th>Id</th>
                                      <th>Nombre</th>
                                      <th>Descripción</th>
                                      <th>Tipo</th>
                                      <th>Dueño</th>
                                      <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  @foreach ($categories as $categoriess)
                                  <tr>
                                    <td>{{ $categoriess->id }}</td>
                                    <td>{{ $categoriess->name }}</td>
                                    <td>{{ $categoriess->description }}</td>
                                    @if($categoriess->type=='add' )
                                        <td>Categoria de Ingreso</td>
                                    @else
                                        <td>Categoria de Retiro</td>
                                    @endif

                                    <td>
                                      @if($categoriess->owner == 'mama')
                                        <span class="label label-warning">De mamá</span>
                                      @else
                                        <span class="label label-info">Mías</span>
                                      @endif
                                    </td>

                                      <td>
                                     
                                    
                                    
                                    @if($categoriess->id !==1 )
                                      <form role="form" action = "{{ url('/categories/eliminar')}}/{{ $categoriess->id }}" method="post"  enctype="multipart/form-data">
                                            {{method_field('DELETE')}}
                                            {{ csrf_field() }}
                                        <a class="btn btn-sm btn-default" href="{{ url('/categories/edit')}}/{{ $categoriess->id }}"><i class="fa fa-edit"></i></a>
                                        <button onclick='if(confirmDel() == false){return false;}' class="btn btn-sm btn-default" type="submit"><i class="fa fa-trash"></i></button></a>
                                      </form>
                                    @endif

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
