@extends('admin_panel.adminLayout') @section('content')
<div class="content-wrapper">
    <div class="row">
        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Products Table <a class="btn btn-lg btn-success" style="float:right;color:white" href="{{route('admin.products.create')}}">+ Add Product</a></h4>
                    <br><br>
                    <div class="row">
                        <div class="col-4">
                            <form action="{{ route('import') }}" method="POST" enctype="multipart/form-data">
                                {{ csrf_field() }}
                                <div class="row">
                                    <div class="col-6">
                                        <input type="file" name="file" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <button class="btn btn-success">Import Bulk Data</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>
                                        Images
                                    </th>
                                    <th>
                                        Name
                                    </th>
                                    <th>
                                        Delete
                                    </th>
                                    <th>
                                        Price
                                    </th>
                                    <th>
                                        Description
                                    </th>
                                    <th>
                                        Category
                                    </th>

                                    <th>
                                        Update
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                            @foreach($prdlist as $prd)
                                <tr>
                                    <td>
                                        <img src="{{ asset($prd->image_name) }}" style="width:100px;height:100px;border-radius:10%;" alt="">
                                    </td>
                                    <td>
                                       <a href="{{route('admin.products.edit', ['id' => $prd->id])}}" class="btn btn-warning">{{$prd->name}}</a>
                                    </td>
                                    <td><a href="{{route('admin.products.delete', ['id' => $prd->id])}}"class="btn btn-danger">Delete</a></td>
                                    <td>
                                        {{$prd->price}}
                                    </td>
                                    <td>
                                        {{$prd->description}}
                                    </td>
                                    <td>
                                        @if(isset($prd->category->name) && !empty($prd->category->name)) {{ $prd->category->name }} @endif
                                    </td>

                                    <td><a href="{{route('admin.products.edit', ['id' => $prd->id])}}" class="btn btn-warning">Edit</a> </td>

                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

