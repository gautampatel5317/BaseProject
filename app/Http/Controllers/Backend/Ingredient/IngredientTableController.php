<?php

namespace App\Http\Controllers\Backend\Ingredient;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ingredient\Ingredient;
use App\Repositories\Backend\Ingredient\IngredientRepository;
use Yajra\DataTables\Facades\DataTables;

class IngredientTableController extends Controller
{
    /**
     * @var $ingredient
     */
    protected $ingredient;
    /**
     * @param \App\Repositories\Backend\Ingredient\IngredientRepository $ingredient
     */
    public function __construct(IngredientRepository $ingredient)
    {
        $this->ingredient = $ingredient;
    }
    /**
     * @param ManageBlogsRequest $request
     *
     * @return mixed
     */
    public function __invoke(Request $request)
    {
        return Datatables::of($this->ingredient->getForDataTable())
			->escapeColumns(['title'])
			->addColumn('checkbox', function ($ingredient) {
                return '';
			})->addColumn('status', function ($ingredient) {
                return ($ingredient->status == "1" ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-danger">Inactive</span>');
			})
			->addColumn('action_buttons', function ($ingredient) {
				return $ingredient->action_buttons;
			})
			->make(true);
    }
}
