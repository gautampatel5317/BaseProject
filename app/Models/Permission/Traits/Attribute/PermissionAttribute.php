<?php
namespace App\Models\Permission\Traits\Attribute;

/**
 * Class CompanyAttribute.
 */
trait PermissionAttribute {
	/**
	 * @return string
	 */
	public function getActionButtonsAttribute() {
		return '<div class="btn-group action-btn">'.
		$this->editButton('permission_edit', 'admin.permissions.edit').
		$this->view('permission_show', 'admin.permissions.show').
		$this->deleteButton('permission_delete', 'admin.permissions.destroy').
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
                    <i data-toggle="tooltip" data-placement="top" title="View" class="fas fa-eye"></i>
                </a>';
	}
	/**
	 *
	 * @param $permission
	 * @param $route
	 * @return string.
	 */
	public function editButton($permission, $route) {
		return '<a href="'.route($route, $this).'" class="text-primary pr-2">
                    <i data-toggle="tooltip" data-placement="top" title="Edit" class="fas fa-edit"></i>
                </a>';
	}

	/**
	 *
	 * @param $permission
	 * @param $route
	 * @return string.
	 */
	public function deleteButton($permission, $route) {
		return '<a href="'.route($route, $this).'"
                  data="'.$this->id.'"  class="delete_record text-danger" data-method="delete"
                    data-trans-button-cancel="'.trans('buttons.general.cancel').'"
                    data-trans-button-confirm="'.trans('buttons.general.crud.delete').'"
                    data-trans-title="'.trans('strings.backend.general.are_you_sure').'">
                        <i data-toggle="tooltip" data-placement="top" title="Delete" class="fa fa-trash"></i>
                </a>';
	}
}