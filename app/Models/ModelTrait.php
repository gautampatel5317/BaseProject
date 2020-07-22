<?php

namespace App\Models;

trait ModelTrait {
	/**
	 * @return string
	 */
	public function getEditButtonAttribute($permission, $route) {
		// if (access()->allow($permission)) {
		return '<a href="'.route($route, $this).'" class="btn btn-flat btn-default text-primary pr-2">
                    <i data-toggle="tooltip" data-placement="top" title="Edit" class="fas fa-edit"></i>
                </a>';
		// }
	}

	/**
	 * @return string
	 */
	public function getDeleteButtonAttribute($permission, $route) {
		// if (access()->allow($permission)) {
		return '<a href="'.route($route, $this).'"
                  data="'.$this->id.'"  class="delete_record btn btn-flat btn-default text-danger pr-2" data-method="delete"
                    data-trans-button-cancel="'.trans('buttons.general.cancel').'"
                    data-trans-button-confirm="'.trans('buttons.general.crud.delete').'"
                    data-trans-title="'.trans('strings.backend.general.are_you_sure').'">
                        <i data-toggle="tooltip" data-placement="top" title="Delete" class="fa fa-trash"></i>
                </a>';
		// }
	}
}
