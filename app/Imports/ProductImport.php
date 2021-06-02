<?php

namespace App\Imports;

use App\Product;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ProductImport implements ToModel, WithHeadingRow
{

    public function model(array $row)
    {
//        dd($row);
        return new Product([
            'name' => $row['name'],
            'units' => $row['unit'],
            'price' => $row['price']
        ]);
    }
}
