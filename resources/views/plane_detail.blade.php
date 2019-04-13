@extends('adminlte::page')

@section('title', 'AdminLTE')

@section('content_header')
<h1>Pesawat</h1>
@stop

@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Pesawat {{$plane->code}}</h3>
            </div>
            <!-- form start -->
            <form role="form" action="{{url('admin/plane/'.$plane->id.'/save')}}">
                <div class="box-body">
                    <div class="form-group">
                        <label>Code</label>
                        <input type="text" name="code" class="form-control" id="code"
                            placeholder="Masukkan kode" value="{{$plane->code}}">
                    </div>
                    <div class="form-group">
                        <label>Baris Tempat Duduk</label>
                        <input type="text" class="form-control" name="seat_row" id="seat_row" placeholder="Masukkan jumlah baris"
                            value="{{$plane->seat_row}}">
                    </div>
                    <div class="form-group">
                        <label>Kolom tempat duduk</label>
                        <input type="text" class="form-control" name="seat_column" id="seat_column" placeholder="Masukkan jumlah kolom"
                            value="{{$plane->seat_column}}">
                    </div>
                    <div class="form-group">
                        <label>Select</label>
                        <select class="form-control" name="airline_id">
                            @foreach($airline as $a)
                            @if($a->id == $plane->airline_id)
                            <option value="{{$a->id}}" selected>{{$a->name}}</option>
                            @else
                            <option value="{{$a->id}}">{{$a->name}}</option>
                            @endif
                            @endforeach
                        </select>
                    </div>
                </div>
                <!-- /.box-body -->

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
