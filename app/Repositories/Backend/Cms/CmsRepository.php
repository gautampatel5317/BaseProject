<?php
namespace App\Repositories\Backend\Cms;

use App\Repositories\BaseRepository;
use App\Models\Cms\Cms;

class CmsRepository extends BaseRepository
{

    protected $model;

    public function __construct(Cms $model)
    {
        $this->model = $model;
    }
    const MODEL = Cms::class;
    /**
     * Get Cms data
     */
    public function getForDataTable()
    {
        return $this->model->orderByDesc('id')->get();
    }

    /**
     * {@inheritDoc}
     */
    public function create(array $input)
    {
        $input['created_by'] = auth()->user()->id;
        return Cms::create($input);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(array $input, $id)
    {
        $record = $this->model->find($id);
        $input['updated_by'] = auth()->user()->id;
        return $record->update($input);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $record = $this->model->find($id);
        return $record->delete();
    }
}
?>