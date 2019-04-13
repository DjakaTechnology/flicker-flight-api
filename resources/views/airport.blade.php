@extends('adminlte::page')

@section('title', 'AdminLTE')

@section('content_header')
<h1>Bandara</h1>
@stop

@section('content')
<div class="box box-primary">
    <div class="box-header with-border">
        <h1 class="box-title">Cari Data Bandara</h1>
        <div class="box-tools pull-right">
            
        </div>
    </div>
    <div class="box-body">
    <table id="table" class="table table-striped table-bordered">
    <thead>
        <tr>
            <th>Nama</th>
            <th>Kode</th>
            <th>Kota</th>
            <th>Alamat</th>
        </tr>
    </thead>
    <tbody>
        @foreach($airport as $a)
        <tr>
            <td>{{$a->name}}</td>
            <td>{{$a->code}}</td>
            <td>{{$a->city}}</td>
            <td>{{$a->address}}</td>
        </tr>
        @endforeach
    </tbody>
</table>
    </div><!-- /.box-body -->
    <div class="box-footer">
        The footer of the box
    </div><!-- box-footer -->
</div><!-- /.box -->
@stop

@section('js')
<script>
    $(document).ready(function () {
        $('#table').dataTable();
    });

</script>
@stop
