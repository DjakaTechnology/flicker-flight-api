@extends('adminlte::page')

@section('title', 'Bandara | Flicker')

@section('content_header')
<h1>Bandara</h1>
@stop

@section('content')
<div class="box box-primary">
    <div class="box-header with-border">
        <h1 class="box-title">Cari Data Bandara</h1>
        <div class="box-tools pull-right">
            <a href="{{url('admin/airport/new')}}"><button class="btn btn-success">Tambah</button></a>
        </div>
    </div>
    <div class="box-body">
        <table id="table" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Id</td>
                    <th>Nama</th>
                    <th>Kode</th>
                    <th>Kota</th>
                    <th>Alamat</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($airport as $a)
                <tr>
                    <td>{{$a->id}}</td>
                    <td>{{$a->name}}</td>
                    <td>{{$a->code}}</td>
                    <td>{{$a->city}}</td>
                    <td>{{$a->address}}</td>
                    <td>
                        <a href="{{url('admin/airport/'.$a->id)}}">
                            <i class="fa fa-pencil"></i>
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="{{url('admin/airport/'.$a->id.'/delete')}}">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
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
