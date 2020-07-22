<?php
namespace App\Models\Customer\Traits\Attribute;

/**
 * Class CompanyAttribute.
 */
trait CustomerAttribute {
	/**
	 * @return string
	 */
	public function getActionButtonsAttribute() {
		return '<div class="btn-group action-btn">'.
		$this->editButton('edit-blog', 'admin.customers.edit').
		$this->view('edit-blog', 'admin.customers.show').
		$this->deleteButton('delete-blog', 'admin.customers.destroy').
		'</div>';
	}
	/**
	 * Show Customerss
	 */
	public function view($permission, $route) {
		if (\Gate::allows('customer_show')) {
			return '<a href="'.route($route, $this).'" class="text-primary pr-2">
                    <i data-toggle="tooltip" data-placement="top" title="View" class="fas fa-eye"></i>
				</a>';
		}
	}
	/**
	 * @return string
	 */
	public function editButton($permission, $route) {
		if (\Gate::allows('customer_edit')) {
			return '<a href="'.route($route, $this).'" class="text-primary pr-2">
                    <i data-toggle="tooltip" data-placement="top" title="Edit" class="fas fa-edit"></i>
				</a>';
		}
	}

	/**
	 * @return string
	 */
	public function deleteButton($permission, $route) {
		if (\Gate::allows('customer_delete')) {
			return '<a href="'.route($route, $this).'"
                  data="'.$this->id.'"  class="delete_record text-danger" data-method="delete"
                    data-trans-button-cancel="'.trans('buttons.general.cancel').'"
                    data-trans-button-confirm="'.trans('buttons.general.crud.delete').'"
                    data-trans-title="'.trans('strings.backend.general.are_you_sure').'">
                        <i data-toggle="tooltip" data-placement="top" title="Delete" class="fa fa-trash"></i>
                </a>';
		}
	}
}