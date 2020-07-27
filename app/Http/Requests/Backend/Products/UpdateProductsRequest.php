<?php

namespace App\Http\Requests\Backend\Products;

use App\Models\Products\Products;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class UpdateProductsRequest extends FormRequest
{
    public function authorize()
    {
        return \Gate::allows('products_edit');
    }

    public function rules(Request $request)
    {
        $rules = [
            'title' => "required|unique:products,title,{$request->id}",
            'description' => 'required',
            'category_id' => 'required',
            'seller_id' => 'required',
            'rate' => 'required',
            'sale_rate' => 'required',
        ];
        if(!empty($request->file('image'))) {
            $allowedfileExtension = ['jpg', 'png', 'jpeg'];
            foreach ($request->file('image') as $file) {
                $extension = strtolower($file->getClientOriginalExtension());
                if (!in_array($extension, $allowedfileExtension)) {
                    $rules['image'] = 'image|mimes:jpeg,png';
                }
            }
        }
        return $rules;
    }
}
