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
                <h3 class="box-title">Edit Bandara {{$airport->name}}</h3>
            </div>
            <!-- form start -->
            <form role="form" action="{{url('admin/airport/1/update')}}">
                <div class="box-body">
                    <div class="form-group">
                        <label>Nama</label>
                        <input type="text" name="name" class="form-control" id="name" placeholder="Masukkan nama bandara" value="{{$airport->name}}">
                    </div>
                    <div class="form-group">
                        <label>Kode</label>
                        <input type="text" class="form-control" name="code" id="code" placeholder="Masukkan kode" value="{{$airport->code}}">
                    </div>
                    <div class="form-group">
                        <label>Kota</label>
                        <input type="text" class="form-control" name="city" id="city" placeholder="Masukkan kota" value="{{$airport->city}}">
                    </div>
                    <div class="form-group">
                        <label>Alamat</label>
                        <textarea type="text" class="form-control" name="address" id="address" placeholder="Masukkan alamat">{{$airport->address}}</textarea>
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
