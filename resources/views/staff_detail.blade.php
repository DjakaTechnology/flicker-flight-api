@extends('adminlte::page')

@section('title', 'Pelanggan | Flicker')

@section('content_header')
<h1>Staff | Flicker</h1>
@stop

@section('content')
<div class="row">
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Edit Staff {{$staff->name}}</h3>
            </div>
            <!-- form start -->
            <form role="form" action="{{url('admin/staff/'.$staff->id.'/save')}}">
                <div class="box-body">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" name="email" class="form-control" id="email"
                            placeholder="Masukkan email" value="{{$staff->email}}">
                    </div>
                    <div class="form-group">
                        <label>Nama</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Masukkan nama"
                            value="{{$staff->name}}">
                    </div>
                    @if($staff->id == -1)
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" id="name" placeholder="Masukkan Password"
                            value="">
                    </div>
                    @endif
                    <div class="form-group">
                        <label>Level</label>
                        <select class="form-control" name="level_id">
                            @foreach($level as $a)
                            @if($a->id == $staff->level_id)
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
