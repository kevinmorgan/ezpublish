{let version=fetch(content,version,hash(object_id,$browse.content.object_id,version_id,$browse.content.object_version))}
<div class="maincontentheader">
<h1>
    {'Choose related objects'
     |i18n('design/standard/content/view')}
</h1>
</div>

<p>
    {"Please choose objects which you want to relate to %name.

    Select your objects and click the %buttonname button.
    Using the recent and bookmark items for quick selection is also possible.
    Click on object names to change the browse listing."
    |i18n('design/standard/content/view',,
          hash('%name',$version.version_name,
               '%buttonname','Select'|i18n('design/standard/content/view')))
    |nl2br}
</p>
{/let}