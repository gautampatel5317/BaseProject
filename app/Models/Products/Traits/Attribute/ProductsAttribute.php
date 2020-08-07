<?php

namespace App\Models\Products\Traits\Attribute;

/**
 * Class ProductsAttribute.
 */
trait ProductsAttribute {
	/**
	 * @return string
	 */
	public function getActionButtonsAttribute() {
		if (\Auth::user()->roles->first()->title == 'Seller') {
			$editRoute   = 'products.edit';
			$deleteRoute = 'products.destroy';
			$viewRoute   = 'products.show';
		} else {
			$editRoute   = 'admin.products.edit';
			$deleteRoute = 'admin.products.destroy';
			$viewRoute   = 'admin.products.show';
		}
		return '<div class="btn-group action-btn">'.
		$this->statusButton().
		$this->editButton('edit-blog', $editRoute).
		$this->view('products_show', $viewRoute).
		$this->deleteButton('delete-blog', $deleteRoute).
		'</div>';
	}
	/**
	 *
	 * @param $permission
	 * @param $route
	 * @return string.
	 */
	public function view($permission, $route) {
		return '<a href="'.route($route, $this).'" class="text-primary pr-2">
                    <i data-toggle="tooltip" data-placement="top" title="View" class="fa fa-eye"></i>
                </a>';
	}
	/**
	 * @return string
	 */
	public function editButton($permission, $route) {
		if (\Gate::allows('products_edit')) {
			return '<a href="'.route($route, $this).'" class="text-primary pr-2">
                    <i data-toggle="tooltip" data-placement="top" title="Edit" class="fa fa-edit"></i>
				</a>';
		}
	}

	/**
	 * @return string
	 */
	public function deleteButton($permission, $route) {
		if (\Gate::allows('products_delete')) {
			return '<a href="'.route($route, $this).'"
                  data="'.$this->id.'"  class="delete_record text-danger" data-method="delete"
                    data-trans-button-cancel="'.trans('buttons.general.cancel').'"
                    data-trans-button-confirm="'.trans('buttons.general.crud.delete').'"
                    data-trans-title="'.trans('strings.backend.general.are_you_sure').'">
                        <i data-toggle="tooltip" data-placement="top" title="Delete" class="fa fa-trash"></i>
                </a>';
		}
	}
	/**
	 * For status button
	 */
	public function statusButton() {
		if (\Gate::allows('products_edit')) {
			$checked = ($this->status == "1"?"checked":"");
			return '<div class="custom-control custom-switch ml-2">
                <input type="checkbox" class="custom-control-input change_status" id="customSwitch'.$this->id.'" '.$checked.' data = '.$this->id.' >
                <label class="custom-control-label" for="customSwitch'.$this->id.'"></label>
            </div>';
		}
	}
}
