<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\categories;
use App\summary;
use App\attributes;
use App\bitacora;
use Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class balanceController extends Controller
{

    public function getAmount($in=0){
//        dd($in);
        return $in;
    }

    private function generateDateRange(Carbon $start_date, Carbon $end_date)
    {
        $dates = [];
        for($date = $start_date; $date->lte($end_date); $date->addDay()) {
            $dates[] = $date->format('m-Y');
        }
        $dates = array_unique($dates);
        return $dates;
    }

    public function filterData($d,$f){
        $d = $d->filter(function ($value, $key) use($f) {
            return $value->numberOf === $f;
        });
        if(count($d)<1){
            $d  =  null;
            return $d;
        }
        return $d->all();
    }

    public function index(Request $request)
    {
        ini_set('memory_limit', -1);

        $year = $request->input('year');
        $tipo = $request->input('tipo');
        $start = $request->input('start');
        $finish = $request->input('finish');
        $categorias = $request->input('categoria');




        $categories = categories::whereNotIn('id', [1])->where('type','=',$tipo)->orderBy('name')->get();
        if($year && !$start && !$finish && !$categorias){


            //$tipo = $request->input('tipo');


            $start = Carbon::parse($start);
            $finish =Carbon::parse($finish);

            $dataTmp = array();
            $r=(new summaryController)->pass($act='categoria');
            if($r>0){
                //$categories = categories::whereNotIn('id', [1])->get();
                if( $categorias) {
                    $categoriaselet = categories::where('id','=',$categorias)->first();

                    if($categoriaselet->id){
                        $summary = summary::where('categories_id','=',$categoriaselet->id)->where('future','=',1)->get();
                        $attrs = attributes::where('id_categorie','=',$categoriaselet->id)->get();
//
                        $data = DB::table('summary')
                            ->join('categories','categories.id','=','summary.categories_id')
                            ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                                ,'categories.type as categories_type', 'categories.description as categories_description')
                            ->where('categories_id','=',$categoriaselet->id)
                            ->where('categories.type','=',$tipo)
                            ->whereNotIn('categories.id', [1])
                            ->where('future','=',1)->get();

                        $data = $data->map(function($item) {
                            $summaryCreateAt = Carbon::parse($item->created_at);
                            $numberOf = $summaryCreateAt->format('m-Y');
                            if ($item->id_attr) {
                                $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                                $item->subcats = $lados;
                            }else {
                                $item->subcats = null;
                            }
                            $item->numberOf = $numberOf;
                            //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                            return $item;
                        });



                        $listDates = $this->generateDateRange($start,$finish);
                        foreach ($listDates as $d){
                            $dataTmp[$d] = $this->filterData($data,$d);
                        }
                    }

                    return view('vendor.adminlte.balance.balance',
                        ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                            'subcategorias'=>$attrs, 'getAmount'=>$this->getAmount(), 'cateselet'=>$categoriaselet,'tipom'=>$tipo,'yearSelected'=>$year]);
                }
                else {
                    $data = DB::table('summary')
                        ->join('categories','categories.id','=','summary.categories_id')
                        ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                            ,'categories.type as categories_type', 'categories.description as categories_description')
                        ->where('categories.type','=',$tipo)
                        ->whereNotIn('categories.id', [1])
                        ->where('future','=',1)->get();

                    $data = $data->map(function($item) {
                        $summaryCreateAt = Carbon::parse($item->created_at);
                        $numberOf = $summaryCreateAt->format('m-Y');
                        if ($item->id_attr) {
                            $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                            $item->subcats = $lados;
                        }else {
                            $item->subcats = null;
                        }
                        $item->numberOf = $numberOf;
                        //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                        return $item;
                    });
                    $dt = $year;

                    $f1= $dt.'-01-01';
                    $f2= $dt.'-12-31';
                    $start =  Carbon::parse( $f1);
                    $finish = Carbon::parse($f2);

                    $listDates = $this->generateDateRange($start,$finish);
                    foreach ($listDates as $d){
                        $dataTmp[$d] = $this->filterData($data,$d);
                    }
                    $summary = array();
                    $attrs = categories::whereNotIn('id', [1])->where('type','=',$tipo)->orderBy('name')->get();

                    $categoriaselet = array();
                    $catesnull= categories::all();
                    $data = array();

                    return view('vendor.adminlte.balance.balance',
                        ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                            'subcategorias'=>$attrs, 'cateselet'=>$categoriaselet, 'tipom'=>$tipo, 'filter'=>false,'yearSelected'=>$year]);
                }
            }else{
                return view('vendor.adminlte.balance',['summary'=>null]);
            }

        } else {
            //echo 'fecha: '.$request->input('start');
            $start = $request->input('start');
            $finish = $request->input('finish');
            $tipo = $request->input('tipo');
            $categorias = $request->input('categoria');

            if(!$tipo){
                $tipo= 'out';
            }

            $dt = $year;




            if ($start){
                $start1 = Carbon::parse($start);
            }
            else{
                $start1 =  Carbon::parse( $dt.'-01-01');
            }

            if ($finish){
                $finish1 =Carbon::parse($finish);
            }
            else{
                $finish1 = Carbon::parse($dt.'-12-31');
            }


            $dataTmp = array();
            $r=(new summaryController)->pass($act='categoria');

            if($r>0){
                $categories = categories::whereNotIn('id', [1])->get();

                if( $categorias) {
                    $categoriaselet = categories::where('id','=',$categorias)->first();

                    if($categoriaselet->id){
                        $summary = summary::where('categories_id','=',$categoriaselet->id)->where('future','=',1)->get();
                        $attrs = attributes::where('id_categorie','=',$categoriaselet->id)->get();
//
                        $data = DB::table('summary')
                            ->join('categories','categories.id','=','summary.categories_id')
                            ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                                ,'categories.type as categories_type', 'categories.description as categories_description')
                            ->where('categories_id','=',$categoriaselet->id)
                            ->where('categories.type','=',$tipo)
                            ->whereNotIn('categories.id', [1])
                            ->where('future','=',1)->get();

                        $data = $data->map(function($item) {
                            $summaryCreateAt = Carbon::parse($item->created_at);
                            $numberOf = $summaryCreateAt->format('m-Y');
                            if ($item->id_attr) {
                                $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                                $item->subcats = $lados;
                            }else {
                                $item->subcats = null;
                            }
                            $item->numberOf = $numberOf;
                            //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                            return $item;
                        });


                            $listDates = $this->generateDateRange($start1,$finish1);
                            foreach ($listDates as $d){
                                $dataTmp[$d] = $this->filterData($data,$d);
                            }


                    }

                    return view('vendor.adminlte.balance.balance',
                        ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                            'subcategorias'=>$attrs, 'getAmount'=>$this->getAmount(), 'cateselet'=>$categoriaselet,'tipom'=>$tipo, 'filter'=> true,'start'=>$start,'finish'=>$finish,'yearSelected'=>$year]);
                }
                else {


                    $data = DB::table('summary')
                        ->join('categories','categories.id','=','summary.categories_id')
                        ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                            ,'categories.type as categories_type', 'categories.description as categories_description')
                        ->where('categories.type','=',$tipo)
                        ->whereNotIn('categories.id', [1])
                        ->where('future','=',1)->get();

                    $data = $data->map(function($item) {
                        $summaryCreateAt = Carbon::parse($item->created_at);
                        $numberOf = $summaryCreateAt->format('m-Y');
                        if ($item->id_attr) {
                            $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                            $item->subcats = $lados;
                        }else {
                            $item->subcats = null;
                        }
                        $item->numberOf = $numberOf;
                        //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                        return $item;
                    });




                    $listDates = $this->generateDateRange($start1,$finish1);
                    print_r($listDates);
                    foreach ($listDates as $d){
                        $dataTmp[$d] = $this->filterData($data,$d);
                    }
                    $summary = array();
                    $attrs = categories::whereNotIn('id', [1])->where('type','=',$tipo)->orderBy('name')->get();

                    $categoriaselet = array();
                    $catesnull= categories::all();
                    $data = array();


                    return view('vendor.adminlte.balance.balance',
                        ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                            'subcategorias'=>$attrs, 'cateselet'=>$categoriaselet,'tipom'=>$tipo, 'filter'=> true,'yearSelected'=>$year]);
                }
            }else{
                return view('vendor.adminlte.balance',['summary'=>null]);
            }
        }

    }
    public function indexinit(Request $request)
    {
        ini_set('memory_limit', -1);
        $start = $request->input('start');
        $finish = $request->input('finish');
        $categorias = $request->input('categoria');
        $tipo= 'out';

        $categories = categories::whereNotIn('id', [1])->where('type','=',$tipo)->orderBy('name')->get();
        $start = Carbon::parse($start);
        $finish =Carbon::parse($finish);

        $dataTmp = array();
        $r=(new summaryController)->pass($act='categoria');
        if($r>0){
            //$categories = categories::whereNotIn('id', [1])->get();
            if( $categorias) {
                $categoriaselet = categories::where('id','=',$categorias)->first();

                if($categoriaselet->id){
                    $summary = summary::where('categories_id','=',$categoriaselet->id)->where('future','=',1)->get();
                    $attrs = attributes::where('id_categorie','=',$categoriaselet->id)->get();
//
                    $data = DB::table('summary')
                        ->join('categories','categories.id','=','summary.categories_id')
                        ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                            ,'categories.type as categories_type', 'categories.description as categories_description')
                        ->where('categories_id','=',$categoriaselet->id)
                        ->where('categories.type','=',$tipo)
                        ->whereNotIn('categories.id', [1])
                        ->where('future','=',1)->get();

                    $data = $data->map(function($item) {
                        $summaryCreateAt = Carbon::parse($item->created_at);
                        $numberOf = $summaryCreateAt->format('m-Y');
                        if ($item->id_attr) {
                            $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                            $item->subcats = $lados;
                        }else {
                            $item->subcats = null;
                        }
                        $item->numberOf = $numberOf;
                        //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                        return $item;
                    });



                    $listDates = $this->generateDateRange($start,$finish);
                    foreach ($listDates as $d){
                        $dataTmp[$d] = $this->filterData($data,$d);
                    }
                }

                return view('vendor.adminlte.balance.balance',
                    ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                        'subcategorias'=>$attrs, 'getAmount'=>$this->getAmount(), 'cateselet'=>$categoriaselet,'tipom'=>$tipo]);
            }
            else {
                $data = DB::table('summary')
                    ->join('categories','categories.id','=','summary.categories_id')
                    ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                        ,'categories.type as categories_type', 'categories.description as categories_description')
                    ->where('categories.type','=',$tipo)
                    ->whereNotIn('categories.id', [1])
                    ->where('future','=',1)->get();

                $data = $data->map(function($item) {
                    $summaryCreateAt = Carbon::parse($item->created_at);
                    $numberOf = $summaryCreateAt->format('m-Y');
                    if ($item->id_attr) {
                        $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                        $item->subcats = $lados;
                    }else {
                        $item->subcats = null;
                    }
                    $item->numberOf = $numberOf;
                    //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                    return $item;
                });
                $dt = Carbon::now()->year;

                $f1= $dt.'-01-01';
                $f2= $dt.'-12-31';
                $start =  Carbon::parse( $f1);
                $finish = Carbon::parse($f2);

                $listDates = $this->generateDateRange($start,$finish);
                foreach ($listDates as $d){
                    $dataTmp[$d] = $this->filterData($data,$d);
                }
                $summary = array();
                $attrs = categories::whereNotIn('id', [1])->where('type','=',$tipo)->orderBy('name')->get();
                $categoriaselet = array();
                $catesnull= categories::all();
                $data = array();

                return view('vendor.adminlte.balance.balance',
                    ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                        'subcategorias'=>$attrs, 'cateselet'=>$categoriaselet, 'tipom'=>$tipo, 'filter'=>false]);
            }
        }else{
            return view('vendor.adminlte.balance',['summary'=>null]);
        }
    }
    public function indexadd(Request $request)
    {
        ini_set('memory_limit', -1);
        $start = $request->input('start');
        $finish = $request->input('finish');
        $categorias = $request->input('categoria');
        $tipo= 'add';

        $categories = categories::whereNotIn('id', [1])->where('type','=',$tipo)->orderBy('name')->get();
        $start = Carbon::parse($start);
        $finish =Carbon::parse($finish);

        $dataTmp = array();
        $r=(new summaryController)->pass($act='categoria');
        if($r>0){
//            $categories = categories::all();


            if( $categorias) {
                $categoriaselet = categories::where('id','=',$categorias)->first();

                if($categoriaselet->id){
                    $summary = summary::where('categories_id','=',$categoriaselet->id)->where('future','=',1)->get();
                    $attrs = attributes::where('id_categorie','=',$categoriaselet->id)->get();
//
                    $data = DB::table('summary')
                        ->join('categories','categories.id','=','summary.categories_id')
                        ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                            ,'categories.type as categories_type', 'categories.description as categories_description')
                        ->where('categories_id','=',$categoriaselet->id)
                        ->where('categories.type','=',$tipo)
                        ->whereNotIn('categories.id', [1])
                        ->where('future','=',1)->get();

                    $data = $data->map(function($item) {
                        $summaryCreateAt = Carbon::parse($item->created_at);
                        $numberOf = $summaryCreateAt->format('m-Y');
                        if ($item->id_attr) {
                            $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                            $item->subcats = $lados;
                        }else {
                            $item->subcats = null;
                        }
                        $item->numberOf = $numberOf;
                        //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                        return $item;
                    });



                    $listDates = $this->generateDateRange($start,$finish);
                    foreach ($listDates as $d){
                        $dataTmp[$d] = $this->filterData($data,$d);
                    }
                }

                return view('vendor.adminlte.balance.balance',
                    ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                        'subcategorias'=>$attrs, 'getAmount'=>$this->getAmount(), 'cateselet'=>$categoriaselet,'tipom'=>$tipo]);
            }
            else {
                $data = DB::table('summary')
                    ->join('categories','categories.id','=','summary.categories_id')
                    ->select('summary.*', 'categories.name as categories_name', 'categories.id as categories_id'
                        ,'categories.type as categories_type', 'categories.description as categories_description')
                    ->where('categories.type','=',$tipo)
                    ->whereNotIn('categories.id', [1])
                    ->where('future','=',1)->get();

                $data = $data->map(function($item) {
                    $summaryCreateAt = Carbon::parse($item->created_at);
                    $numberOf = $summaryCreateAt->format('m-Y');
                    if ($item->id_attr) {
                        $lados = attributes::where('id','=',$item->id_attr)->first();
//                    $lados = DB::table('attr_values')->where('id_categorie','=',$item->categories_id)->get();
                        $item->subcats = $lados;
                    }else {
                        $item->subcats = null;
                    }
                    $item->numberOf = $numberOf;
                    //$this->insideArray(null,['key'=>$numberOf,'value'=>$item]);
                    return $item;
                });
                $dt = Carbon::now()->year;

                $f1= $dt.'-01-01';
                $f2= $dt.'-12-31';
                $start =  Carbon::parse( $f1);
                $finish = Carbon::parse($f2);

                $listDates = $this->generateDateRange($start,$finish);
                foreach ($listDates as $d){
                    $dataTmp[$d] = $this->filterData($data,$d);
                }
                $summary = array();
                $attrs = categories::whereNotIn('id', [1])->where('type','=',$tipo)->orderBy('name')->get();
                $categoriaselet = array();
                $catesnull= categories::all();
                $data = array();

                return view('vendor.adminlte.balance.balance',
                    ['categories'=>$categories, 'subcate'=>$summary, 'data'=>$data,'timeline'=>$dataTmp,
                        'subcategorias'=>$attrs, 'cateselet'=>$categoriaselet, 'tipom'=>$tipo, 'filter'=>false]);
            }
        }else{
            return view('vendor.adminlte.balance',['summary'=>null]);
        }
    }
}
