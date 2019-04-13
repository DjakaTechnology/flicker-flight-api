@extends('adminlte::page')

@section('title', 'Pesawat | Flicker')

@section('content_header')
<h1>Pesawat</h1>
@stop

@section('content')
<div class="box box-primary">
    <div class="box-header with-border">
        <h1 class="box-title">Cari Data Pesawat</h1>
        <div class="box-tools pull-right">

        </div>
    </div>
    <div class="box-body">
        <table id="table" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Kode</th>
                    <th>Baris</th>
                    <th>Kolom</th>
                    <th>Maskapai</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($plane as $a)
                <tr>
                    <td>{{$a->id}}</td>
                    <td>{{$a->code}}</td>
                    <td>{{$a->seat_row}}</td>
                    <td>{{$a->seat_column}}</td>
                    <td>{{$a->airline->name}}</td>
                    <td>
                        <a href="{{url('admin/plane/'.$a->id)}}">
                            <i class="fa fa-pencil"></i>
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="{{url('admin/plane/'.$a->id.'/delete')}}">
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
