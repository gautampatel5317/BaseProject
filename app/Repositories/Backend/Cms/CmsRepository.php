<?php
namespace App\Repositories\Backend\Cms;

use App\Models\CmsTranslation\CmsTranslation;
use App\Models\Cms\Cms;
use App\Repositories\BaseRepository;

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
        return $this->model
            ->select(
                config('tables.cms_pages_table') . '.*',
                config('tables.cms_translations_table') . '.title'
            )
            ->join(config('tables.cms_translations_table'), function ($join) {
                $join->on(config('tables.cms_pages_table') . '.id', '=', config('tables.cms_translations_table') . '.cms_id')
                    ->where(config('tables.cms_translations_table') . '.language', '=', app()->getLocale());
            })
            ->orderByDesc(config('tables.cms_pages_table') . '.id')->get();
    }

    /**
     * {@inheritDoc}
     */
    function create(array $input)
    {
        $cms = new Cms();
        $cms->cannonical_link = $input['cannonical_link'];
        $cms->seo_title = $input['seo_title'];
        $cms->seo_keyword = $input['seo_keyword'];
        $cms->seo_description = $input['seo_description'];
        $cms->status = $input['status'];
        $cms->created_by = auth()->user()->id;

        if ($cms->save()) {
            if (isset($input['title']['en'])) {
                $defaultTitle = $input['title']['en'];
                $defaultDescription = $input['description']['en'];
            } elseif (isset($input['title']['fr'])) {
                $defaultTitle = $input['title']['fr'];
                $defaultDescription = $input['description']['fr'];
            } elseif (isset($input['title']['sp'])) {
                $defaultTitle = $input['title']['sp'];
                $defaultDescription = $input['description']['sp'];
            } elseif (isset($input['title']['cr'])) {
                $defaultTitle = $input['title']['cr'];
                $defaultDescription = $input['description']['cr'];
            }
            //Multiple language data
            foreach (config('panel.available_languages') as $language => $value) {
                $cmsTranslate = [];
                $cmsTranslate['cms_id'] = $cms->id;

                // $cmsTranslate['title'] = (isset($input['title'][$language]) ? $input['title'][$language] : $input['title'][config('panel.primary_language')]);
                // $cmsTranslate['description'] = (isset($input['description'][$language]) ? $input['description'][$language] : $input['description'][config('panel.primary_language')]);
                $cmsTranslate['title'] = (isset($input['title'][$language]) ? $input['title'][$language] : $defaultTitle);
                $cmsTranslate['description'] = (isset($input['description'][$language]) ? $input['description'][$language] : $defaultDescription);
                $cmsTranslate['language'] = $language;
                CmsTranslation::create($cmsTranslate);
            }
            return true;
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    function update(array $input, $id)
    {
        $update = Cms::where('id', $id)->update([
            'cannonical_link' => $input['cannonical_link'],
            'seo_title' => $input['seo_title'],
            'seo_keyword' => $input['seo_keyword'],
            'seo_description' => $input['seo_description'],
            'status' => trim($input['status']),
            'updated_by' => auth()->user()->id,
        ]);
        //Multiple language data
        foreach (config('panel.available_languages') as $language => $value) {
            CmsTranslation::updateOrCreate(
                ['cms_id' => $id, 'language' => $language],
                [
                    'title' => trim($input['title'][$language]),
                    'description' => $input['description'][$language],
                ]
            );
        }
        return true;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    function destroy($id)
    {
        CmsTranslation::where('cms_id', $id)->delete();
        $record = $this->model->find($id);
        return $record->delete();
    }
    /**
     * Get Cms Description with all languages
     */
    function getCmsDescription($id)
    {
        $datas = CmsTranslation::where('cms_id', $id)->get();
        foreach ($datas as $data) {
            $cmsDesc['title'][$data->language] = $data->title;
            $cmsDesc['description'][$data->language] = $data->description;
        }
        return $cmsDesc;
    }
}
