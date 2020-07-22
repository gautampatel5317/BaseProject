<?php

namespace App\Http\Controllers\Backend\Cms;

use App\Http\Controllers\Controller;
use App\Http\Requests\Backend\Cms\StoreCmsRequest;
use App\Http\Requests\Backend\Cms\UpdateCmsRequest;
use App\Models\Cms\Cms;
use App\Repositories\Backend\Cms\CmsRepository;
class CmsController extends Controller{

	protected $model;
	public function __construct(CmsRepository $model)
	{
		$this->model = $model;
	}
    /**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		abort_unless(\Gate::allows('cms_access'), 403);
		return view('backend.cms.index'); 
	}
	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
		abort_unless(\Gate::allows('cms_create'), 403);
		return view('backend.cms.create');
	}
	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(StoreCmsRequest $request) {
		abort_unless(\Gate::allows('cms_create'), 403);
		$input = $request->except('_token');
		$this->model->create($input);
		flash(trans('alerts.cms_add_message'))->success()->important();
		return redirect()->route('admin.cms.index');
	}
	public function show(Cms $id){
		abort_unless(\Gate::allows('cms_show'), 403);
		$cms = Cms::find($id);
		return view('backend.cms.show', compact('cms'));
	}
	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id) {
		abort_unless(\Gate::allows('cms_edit'), 403);
		$cms = Cms::find($id);
		return view('backend.cms.edit', compact('cms'));
	}
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(UpdateCmsRequest $request, $id) {
		abort_unless(\Gate::allows('cms_edit'), 403);
		$input   = $request->except('_token');
		if( $request->get('status') != "1" ){
			$input['status'] = '0';
		}
        $this->model->update($input, $id);
        flash(trans('alerts.cms_edit_message'))->success()->important();
		return redirect()->route('admin.cms.index');
	}
	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		abort_unless(\Gate::allows('cms_delete'), 403);
		$this->model->destroy($id);
		return "success";
	}
	
}
?>