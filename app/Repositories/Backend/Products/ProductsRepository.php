<?php

namespace App\Repositories\Backend\Products;

use App\Repositories\BaseRepository;
use App\Models\Products\Products;
use App\Http\Utilities\FileUploads;
use App\Models\ProductImage\ProductImage;

class ProductsRepository extends BaseRepository
{

    protected $model;

    public function __construct(Products $model)
    {
        $this->model = $model;
    }
    /**
     * Associated Repository Model.
     */
    const MODEL = Products::class;

    /**
     * @return mixed
     */
    public function getForDataTable()
    {
        return $this->model
        ->select(config('tables.products_table').'.*', config('tables.category_table').'.name AS category_name', config('tables.users_table').'.first_name AS seller_name', \DB::raw('(SELECT products_files.image FROM products_files WHERE products_files.product_id = products.id AND SUBSTRING_INDEX(products_files.image,".",-1) IN ("jpg","png","jpeg") ORDER BY products_files.id ASC LIMIT 1) AS image'))
        ->join(config('tables.category_table'), config('tables.category_table').'.id', '=', config('tables.products_table').'.category_id')
        ->join(config('tables.users_table'), config('tables.users_table').'.id', '=', config('tables.products_table').'.seller_id')
        ->orderByDesc('id')->get();
    }
    /**
     *
     * {@inheritDoc}
     *
     * @see \App\Repositories\Products\ProductsRepositoryInterface::create()
     */
    public function create(array $input)
    {
        $product              = new Products();
		$product->title       = $input['title'];
		$product->description = $input['description'];
		$product->category_id = $input['category_id'];
		$product->seller_id   = $input['seller_id'];
		$product->rate        = $input['rate'];
		$product->sale_rate   = $input['sale_rate'];
		$product->status      = $input['status'];
		$product->created_by  = auth()->user()->id;
		if ($product->save()) {
			//upload Product Image
			foreach ($input['image'] as $key => $value) {
				$path        = public_path(config('path.upload.product')).$product->id.'/images/';
				$upload      = new FileUploads();
				$uploadFiles = $upload->upload($value, $path);
				//Product Image Insert
				$productImage             = new ProductImage();
				$productImage->product_id = $product->id;
				$productImage->image      = $uploadFiles;
				$productImage->save();
            }

            //upload Product Video
			foreach ($input['video'] as $key => $value) {
				$path        = public_path(config('path.upload.product')).$product->id.'/video/';
				$upload      = new FileUploads();
				$uploadFiles = $upload->upload($value, $path);
				//Product Image Video
				$productImage             = new ProductImage();
				$productImage->product_id = $product->id;
				$productImage->image      = $uploadFiles;
				$productImage->save();
            }
            
			return true;
		}
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $id)
    {
        //upload Image
		if (isset($input['image'])) {
            $getoldImg = ProductImage::where('product_id', $id)->get();
            if(isset($getoldImg) && !empty($getoldImg)){
                foreach($getoldImg as $imagename){
                    $path_parts = pathinfo($imagename->image);
                    $fileExtension = $path_parts['extension'];
                    if(in_array($fileExtension,array('pdf', 'jpeg', 'png','jpg','bmp','gif','xls','xlsx','doc','docx','txt'))){
                        $usersImage = public_path(config('path.upload.product')).$id.'/images/'.$imagename->image; // get previous image from folder
                        if (file_exists($usersImage)) { // unlink or remove previous image from folder
                            unlink($usersImage);
                        }
                        $deleteOldImg = ProductImage::where('image', $imagename->image)->delete();
                    }
                }
            }
            
			foreach ($input['image'] as $key => $value) {
				$path        = public_path(config('path.upload.product')).$id.'/images/';
				$upload      = new FileUploads();
				$uploadFiles = $upload->upload($value, $path);
				//Product Image Insert
				$productImage             = new ProductImage();
				$productImage->product_id = $id;
				$productImage->image      = $uploadFiles;
				$productImage->save();
			}
        }
        //upload video
		if (isset($input['video'])) {
             $getoldImg = ProductImage::where('product_id', $id)->get();
            if(isset($getoldImg) && !empty($getoldImg)){
                foreach($getoldImg as $imagename){
                    $path_parts = pathinfo($imagename->image);
                    $fileExtension = $path_parts['extension'];
                    if(!in_array($fileExtension,array('pdf', 'jpeg', 'png','jpg','bmp','gif','xls','xlsx','doc','docx','txt'))){
                        $usersImage = public_path(config('path.upload.product')).$id.'/video/'.$imagename->image; // get previous image from folder
                        if (file_exists($usersImage)) { // unlink or remove previous image from folder
                            unlink($usersImage);
                        }
                        $deleteOldImg = ProductImage::where('image', $imagename->image)->delete();
                    }
                    
                }
            } 
			foreach ($input['video'] as $key => $value) {
				$path        = public_path(config('path.upload.product')).$id.'/video/';
				$upload      = new FileUploads();
				$uploadFiles = $upload->upload($value, $path);
				//Product video Insert
				$productImage             = new ProductImage();
				$productImage->product_id = $id;
				$productImage->image      = $uploadFiles;
				$productImage->save();
			}
		}
		$update = Products::where('id', $id)->update([
				'title'       => trim($input['title']),
				'description' => $input['description'],
                'category_id' => trim($input['category_id']),
                'seller_id'   => $input['seller_id'],
				'rate'        => trim($input['rate']),
				'sale_rate'   => trim($input['sale_rate']),
                'status'      => trim($input['status']),
                'updated_by'  => auth()->user()->id
			]);
		return true;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return $this->model->where('id', $id)->delete();
    }
    /**
     * For change Products status
     */
    public function changeStatus($id, $status)
    {
        return $this->model->where('id', $id)
            ->update(['status' => $status, 'updated_by' => auth()->user()->id]);
    }

    public function showProduct($id){
        return $this->model
        ->select('products.*', 'category.name AS category_name', 'users.first_name AS seller_name')
        ->join('category', 'category.id', '=', 'products.category_id')
        ->join('users', 'users.id', '=', 'products.seller_id')
        ->find($id);
    }
}
