@extends('adminlte::page')

@section('title', 'Pelanggan | Flicker')

@section('content_header')
<h1>Pelanggan</h1>
@stop

@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Pelanggan {{$customer->code}}</h3>
            </div>
            <!-- form start -->
            <form role="form" action="{{url('admin/customer/'.$customer->id.'/save')}}">
                <div class="box-body">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" name="email" class="form-control" id="email"
                            placeholder="Masukkan email" value="{{$customer->email}}">
                    </div>
                    <div class="form-group">
                        <label>Nama</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Masukkan nama"
                            value="{{$customer->name}}">
                    </div>
                    <div class="form-group">
                        <label>Alamat</label>
                        <input type="text" class="form-control" name="address" id="address" placeholder="Masukkan jumlah kolom"
                            value="{{$customer->address}}">
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Masukkan jumlah kolom"
                            value="{{$customer->phone}}">
                    </div>
                    <div class="form-group">
                        <label>Select</label>
                        <select class="form-control" name="gender_id">
                            @foreach($gender as $a)
                            @if($a->id == $customer->gender_id)
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
