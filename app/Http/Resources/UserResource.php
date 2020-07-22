<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class UserResource extends Resource {
	/**
	 * Transform the resource into an array.
	 *
	 * @param  \Illuminate\Http\Request
	 *
	 * @return array
	 */
	public function toArray($request) {
		return [
			'id'                => $this->id,
			'is_front'          => $this->is_front,
			'name'              => $this->name,
			'email'             => $this->email,
			'email_verified_at' => $this->email_verified_at,
			'status'            => $this->status,
			'created_at'        => $this->created_at->toIso8601String(),
			'updated_at'        => $this->updated_at->toIso8601String(),
		];
	}
}
