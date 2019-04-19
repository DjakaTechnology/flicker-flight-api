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
                <h3 class="box-title">Edit Pesanan {{$reservation->res_code}}</h3>
            </div>
            <!-- form start -->
            <form role="form" action="{{url('admin/reservation/'.$reservation->id.'/save')}}">
                <div class="box-body">
                <div class="form-group">
                        <label>Kode Pesanan</label>
                        <input type="text" name="code" class="form-control" id="code"
                            placeholder="Masukkan kode" value="{{$reservation->res_code}}" disabled>
                    </div>
                    <div class="form-group">
                        <label>Tanggal Pesanan</label>
                        <input type="text" name="code" class="form-control" id="code"
                            placeholder="Masukkan kode" value="{{$reservation->res_date}}" disabled>
                    </div>
                    <div class="form-group">
                        <label>Seat Code</label>
                        <input type="text" name="seat_code" class="form-control" id="seat_code"
                            placeholder="Masukkan kode tempat duduk" value="{{$reservation->seat_code}}">
                    </div>
                    <div class="form-group">
                        <label>Nama Pemesan</label>
                        <input type="text" name="code" class="form-control" id="code"
                            placeholder="Masukkan kode tempat duduk" value="{{$reservation->customer->name}}" disabled>
                    </div>
                    <div class="form-group">
                        <label>Rute</label>
                        <input type="text" class="form-control" name="seat_row" id="seat_row" placeholder="Masukkan jumlah baris"
                            value="{{$reservation->route_id}}" disabled>
                    </div>
                    <div class="form-group">
                        <label>Lokasi Pemesanan</label>
                        <input type="text" class="form-control" name="res_loc" id="res_loc" placeholder="Masukkan jumlah baris"
                            value="{{$reservation->res_loc}}">
                    </div>
                    <div class="form-group">
                        <label>Checkin</label>
                        <input type="text" class="form-control" name="seat_column" id="seat_column" placeholder="Masukkan jumlah kolom"
                            value="{{$reservation->checkin_at}}" disabled>
                    </div>
                    <div class="form-group">
                        <label>Berangkat Pada</label>
                        <input type="text" class="form-control" name="seat_column" id="seat_column" placeholder="Masukkan jumlah kolom"
                            value="{{$reservation->depart_at}}" disabled>
                    </div>
                    <div class="form-group">
                        <label>Harga</label>
                        <input type="text" class="form-control" name="seat_column" id="seat_column" placeholder="Masukkan jumlah kolom"
                            value="{{$reservation->cost}}'" disabled>
                    </div>
                    <div class="form-group">
                        <label>Bukti Pembayaran</label><br>
                        <img src="{{$reservation->payment_proof}}" width="480px">
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                        <select class="form-control" name="status_id">
                            @foreach($status as $a)
                            @if($a->id == $reservation->status_id)
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
