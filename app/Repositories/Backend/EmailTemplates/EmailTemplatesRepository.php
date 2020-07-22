<?php

namespace App\Repositories\Backend\EmailTemplates;

use App\Exceptions\GeneralException;
use App\Models\EmailTemplates\EmailTemplate;
use App\Repositories\BaseRepository;

/**
 * Class EmailTemplatesRepository.
 */

class EmailTemplatesRepository extends BaseRepository {
	/**
	 * Associated Repository Model.
	 */
	const MODEL = EmailTemplate::class ;

	/**
	 * @return mixed
	 */
	public function getForDataTable() {
		return $this->query()
		            ->select([
				config('tables.email_templates.table').'.id',
				config('tables.email_templates.table').'.title',
				config('tables.email_templates.table').'.subject',
				config('tables.email_templates.table').'.status',
				config('tables.email_templates.table').'.created_at',
				config('tables.email_templates.table').'.updated_at',
			]);
	}
	/**
	 * @param \App\Models\EmailTemplates\EmailTemplate $emailtemplate
	 * @param  $input
	 *
	 * @throws GeneralException
	 *
	 * return bool
	 */
	public function update(EmailTemplate $emailtemplate, array $input) {
		$input['status'] = isset($input['is_active'])?1:0;
		unset($input['is_active']);
		$input['updated_by'] = \Auth::user()->id;
		if ($emailtemplate->update($input)) {
			return true;
		}

		throw new GeneralException(trans('exceptions.backend.emailtemplates.update_error'));
	}
	/**
	 * @param \App\Models\EmailTemplates\EmailTemplate $emailtemplate
	 *
	 * @throws GeneralException
	 *
	 * @return bool
	 */
	public function delete(EmailTemplate $emailtemplate) {
		if ($emailtemplate->delete()) {
			return true;
		}
		throw new GeneralException(trans('exceptions.backend.emailtemplates.delete_error'));
	}
	/**
	 * Email Template Change Status
	 *
	 * @param \App\Http\Requests\Backend\EmailTemplates\EditEmailTemplatesRequest $request
	 * @return mixed
	 */
	public function changeStatus($input) {
		$updateStatus = EmailTemplate::where('id', $input['id'])->update(['status' => $input['status']]);
		return true;

	}

}