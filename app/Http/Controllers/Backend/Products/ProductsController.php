<?php

namespace App\Http\Controllers\Backend\Products;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Products\CreateProductsRequest;
use App\Http\Requests\Backend\Products\StoreProductsRequest;
use App\Http\Requests\Backend\Products\UpdateProductsRequest;
use App\Models\Products\Products;
use App\Models\User\User;
use App\Repositories\Backend\Category\CategoryRepository;
use App\Repositories\Backend\Country\CountryRepository;
use App\Repositories\Backend\Products\ProductsRepository;
use App\Repositories\Backend\User\UserRepository;
use Illuminate\Http\Request;
use File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ProductsController extends Controller
{

    protected $model;
    public function __construct(ProductsRepository $model)
    {
        $this->model = $model;
        $this->imagePath = storage_path('images/products/');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_unless(\Gate::allows('products_access'), 403);
        return view('backend.products.index');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(CreateProductsRequest $request, CategoryRepository $category, UserRepository $user)
    {
        abort_unless(\Gate::allows('products_create'), 403);
        $categoryData = $category->getCategorys();
        $sellerData = $user->getSellers();
        return view('backend.products.create', compact('categoryData', 'sellerData'));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProductsRequest $request)
    {
        abort_unless(\Gate::allows('products_create'), 403);
        $input = $request->except('_token');
        $insertedData = $this->model->create($input);
        if (!empty($request->file('image'))) {
            $files = $request->file('image');
            $imagePath = $this->imagePath . $insertedData->id;
            if (!File::isDirectory($imagePath)) {
                File::makeDirectory($imagePath, 0777, true, true);
            }
            foreach ($files as $file) {
                $imageName = str_replace(' ', '_', pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . "_" . time() . "." . $file->getClientOriginalExtension();
                $uploaded = $file->move($imagePath, $imageName);
                if ($uploaded) {
                    DB::table('products_image')->insert(
                        ['product_id' => $insertedData->id, 'image' => $imageName, 'created_at' => date('Y-m-d H:i:s')]
                    );
                }
            }
        }
        flash(trans('alerts.products_add_message'))->success()->important();
        return redirect()->route('admin.products.index');
    }
    public function show($id)
    {
        $products = $this->model->showProduct($id);
        $images = DB::table('products_image')->where('product_id', $id)->get();
        $productImage = [];
        if (!empty($images)) {
            foreach ($images as $image) {
                $productImage[] = Storage::disk('public')->url('images/products/' . $id . "/" . $image->image);
            }
        }
        abort_unless(\Gate::allows('products_show'), 403);
        return view('backend.products.show', compact('products', 'productImage'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id, CategoryRepository $category, UserRepository $user)
    {
        abort_unless(\Gate::allows('products_edit'), 403);
        $products = Products::find($id);
        $categoryData = $category->getCategorys();
        $sellerData = $user->getSellers();
        $images = DB::table('products_image')->where('product_id', $id)->get();
        $productImage = [];
        if (!empty($images)) {
            foreach ($images as $image) {
                $productImage[] = Storage::disk('public')->url('images/products/' . $id . "/" . $image->image);
            }
        }
        return view('backend.products.edit', compact('products', 'categoryData', 'sellerData', 'productImage'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProductsRequest $request, $id)
    {
        abort_unless(\Gate::allows('products_edit'), 403);
        $input   = $request->except('_token');
        if ($request->get('status') != "1") {
            $input['status'] = '0';
        }
        $this->model->update($input, $id);

        if (!empty($request->file('image'))) {
            $files = $request->file('image');
            $imagePath = $this->imagePath . $id;
            if (!File::isDirectory($imagePath)) {
                File::makeDirectory($imagePath, 0777, true, true);
            }
            foreach ($files as $file) {
                $imageName = str_replace(' ', '_', pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . "_" . time() . "." . $file->getClientOriginalExtension();
                $uploaded = $file->move($imagePath, $imageName);
                if ($uploaded) {
                    DB::table('products_image')->insert(
                        ['product_id' => $id, 'image' => $imageName, 'created_at' => date('Y-m-d H:i:s')]
                    );
                }
            }
        }

        flash(trans('alerts.products_edit_message'))->success()->important();
        return redirect()->route('admin.products.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        abort_unless(\Gate::allows('products_delete'), 403);
        $this->model->destroy($id);
        File::deleteDirectory(storage_path('images/products/' . $id));
        return "success";
    }

    public function changeStatus(Request $request)
    {
        $input = $request->except('_token');
        $flag = $this->model->changeStatus($input['id'], $input['status']);
        if ($flag == 1) {
            return "success";
        } else {
            return "failed";
        }
    }

}
