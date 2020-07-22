<?php

namespace App\Models\EmailTemplates\Traits\Attribute;

/**
 * Class EmailTemplateAttribute.
 */
trait EmailTemplateAttribute {
	/**
	 * @return string
	 */
	public function getActionButtonsAttribute() {
		return '<div class="btn-group action-btn">'
		.$this->statusButton('edit-email-template', 'admin.emailtemplates.edit').
		$this->getEditButtonAttribute('edit-email-template', 'admin.emailtemplates.edit').
		$this->getDeleteButtonAttribute('delete-email-template', 'admin.emailtemplates.destroy').
		'</div>';
	}

	/**
	 * @return string
	 */
	public function getStatusLabelAttribute() {
		if ($this->isActive()) {
			return "<span class='badge badge-success'>".trans('global.email_template.active').'</span>';
		}

		return "<span class='badge badge-danger'>".trans('global.email_template.inactive').'</span>';
	}

	/**
	 * @return bool
	 */
	public function isActive() {
		return $this->status == 1;
	}
	/**
	 * For status button
	 */
	public function statusButton() {
		if (\Gate::allows('edit-email-template')) {
			$checked = ($this->status == "1"?"checked":"");
			return '<div class="custom-control custom-switch ml-2">
                <input type="checkbox" class="custom-control-input change_status" id="customSwitch'.$this->id.'" '.$checked.' data = '.$this->id.' >
                <label class="custom-control-label" for="customSwitch'.$this->id.'"></label>
            </div>';
		}
	}
}
