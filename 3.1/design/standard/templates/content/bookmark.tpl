{let page_limit=30
     can_edit=false()}
{*     list_count=fetch('content','draft_count')} *}
<form action={concat("content/bookmark/")|ezurl} method="post" >

<div class="maincontentheader">
<h1>{"My bookmarks"|i18n("design/standard/content/view")}</h1>
</div>

{let bookmark_list=fetch('content','bookmarks',array())}

{section show=$bookmark_list}

<p>
    {"These are the objects you have bookmarked. Click on an object to view it or if you have sufficient permission you can to edit the object by clicking the edit button.
      If you want to add more objects to this list click the %addbutton button.

      Removing objects will only remove them from this list."
      |i18n("design/standard/content/view",,
            hash('%addbutton',concat('<i>','Add bookmarks'|i18n('design/standard/content/view'),'</i>')))
      |nl2br}
</p>

{section loop=$bookmark_list}
  {section show=$:item.node.object.can_edit}
    {set can_edit=true()}
  {/section}
{/section}

<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <th width="1">
    </th>
    <th width="69%">
        {"Name"|i18n("design/standard/content/view")}
    </th>
    <th width="30%">
        {"Class"|i18n("design/standard/content/view")}
    </th>
    <th width="30%">
        {"Section"|i18n("design/standard/content/view")}
    </th>
    {section show=$can_edit}
        <th width="1">
             {'Edit'|i18n('design/standard/content/view')}
        </th>
    {/section}
</tr>

{section name=Bookmark loop=$bookmark_list sequence=array(bgdark,bglight)}
<tr class="{$:sequence}">
    <td align="left">
        <input type="checkbox" name="DeleteIDArray[]" value="{$:item.id}" />
    </td>

    <td>
        <a href={concat("/content/view/full/",$:item.node_id,"/")|ezurl}>
            {$:item.name|wash}
        </a>
    </td>

    <td>
        {$:item.node.object.content_class.name|wash}
    </td>

    <td>
        {$:item.node.object.section_id}
    </td>

    {section show=$can_edit}
        <td width="1">
            {section show=$:item.node.object.can_edit}
                <a href={concat("content/edit/",$:item.node.contentobject_id)|ezurl}><img src={"edit.png"|ezimage} alt="{'Edit'|i18n('design/standard/content/view')}" /></a>
            {/section}
        </td>
    {/section}
</tr>
{/section}

<tr>
    <td align="left">
        <input type="image" name="RemoveButton" value="{'Remove'|i18n('design/standard/content/view')}" src={"trash.png"|ezimage} alt="{'Remove'|i18n('design/standard/content/view')}" />
    </td>
    <td colspan="3">
    </td>
</tr>
</table>
{*{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri=concat('/content/draft/')
         item_count=$list_count
         view_parameters=$view_parameters
         item_limit=$page_limit}
*}
{section-else}

<div class="feedback">
    <h2>{"You have no bookmarks"|i18n("design/standard/content/view")}</h2>
</div>

{/section}

<div class="buttonblock">
    <input class="defaultbutton" type="submit" name="AddButton" value="{'Add bookmarks'|i18n('design/standard/content/view')}" />
</div>


</form>
