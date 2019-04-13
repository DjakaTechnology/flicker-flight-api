@extends('adminlte::page')

@section('title', 'Rute | Flicker')

@section('content_header')
<h1>Pesawat</h1>
@stop

@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Rute {{$route->id}}</h3>
            </div>
            <!-- form start -->
            <form role="form" action="{{url('admin/plane/'.$route->id.'/save')}}">
                <div class="box-body">
                    <div class="form-group">
                        <label>Dari</label>
                        <select class="form-control" name="airport_from_id">
                            @foreach($airport as $a)
                            @if($a->id == $route->airport_from_id)
                            <option value="{{$a->id}}" selected>{{$a->name}}</option>
                            @else
                            <option value="{{$a->id}}">{{$a->name}}</option>
                            @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Ke</label>
                        <select class="form-control" name="airport_to_id">
                            @foreach($airport as $a)
                            @if($a->id == $route->airport_to_id)
                            <option value="{{$a->id}}" selected>{{$a->name}}</option>
                            @else
                            <option value="{{$a->id}}">{{$a->name}}</option>
                            @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Brangkat Pada:</label>
                        <div class="input-group date">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="datetime-local" name="depart_at" class="form-control pull-right" id="depart_at" value="{{$route->depart_at}}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Harga</label>
                        <input type="number" class="form-control" name="price" id="price" placeholder="Masukkan harga"
                            value="{{$route->price}}">
                    </div>
                    <div class="form-group">
                        <label>Pesawat</label>
                        <select class="form-control" name="airline_id">
                            @foreach($plane as $a)
                            @if($a->id == $route->plane_id)
                            <option value="{{$a->id}}" selected>{{$a->code}} ({{$a->airline->name}})</option>
                            @else
                            <option value="{{$a->id}}">{{$a->code}} ({{$a->airline->name}})</option>
                            @endif
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
        <!-- /.box -->
        @stop

        @section('js')
        <script>
            $(document).ready(function () {
                $('#table').dataTable();
            });

        </script>
        @stop
