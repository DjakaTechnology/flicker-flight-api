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
                    <th>Logo</th>
                    <th>Deskripsi</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($airline as $a)
                <tr>
                    <td>{{$a->name}}</td>
                    <td><img src="{{$a->logo}}" height="24px"/></td>
                    <td>{{$a->description}}</td>
                    <td>
                        <a href="{{url('admin/airline/'.$a->id)}}">
                            <i class="fa fa-pencil"></i>
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="{{url('admin/airline/'.$a->id.'/delete')}}">
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
