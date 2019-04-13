@extends('adminlte::page')

@section('title', 'AdminLTE')

@section('content_header')
<h1>Bandara</h1>
@stop

@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Bandara {{$airline->name}}</h3>
            </div>
            <!-- form start -->
            <form role="form" action="{{url('admin/airline/'.$airline->id.'/update')}}">
                <div class="box-body">
                    <div class="form-group">
                        <label>Nama</label>
                        <input type="text" name="name" class="form-control" id="name" placeholder="Masukkan nama maskapai" value="{{$airline->name}}">
                    </div>
                    <div class="form-group">
                        <label>Logo</label>
                        <input type="text" class="form-control" name="logo" id="logo" placeholder="Masukkan url logo" value="{{$airline->logo}}">
                    </div>
                    <div class="form-group">
                        <label>Deskripsi</label>
                        <input type="text" class="form-control" name="description" id="description" placeholder="Masukkan deskripsi" value="{{$airline->description}}">
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
