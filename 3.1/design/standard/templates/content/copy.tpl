<form action={concat("/content/copy/",$object.id,"/")|ezurl} method="post">

{let object_versions=$object.versions}

<div class="maincontentheader">
<h1>{"Copying %1"|i18n("design/standard/content/copy",,array($object.name|wash))}</h1>
</div>

<div class="block">
<p>{"Version count is %1, and current version is %2."|i18n("design/standard/content/copy",,array($object_versions|count,$object.current_version))}</p>
</div>

<div class="block">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
  <td><label>{"Copy all versions"|i18n("design/standard/content/copy")}</label></td>
  <td><input type="radio" name="VersionChoice" value="1"/></td>
</tr>
<tr>
  <td><label>{"Copy current version"|i18n("design/standard/content/copy")}</label></td>
  <td><input type="radio" name="VersionChoice" value="2" checked="checked"/></td>
</tr>
</table>
</div>

<div class="buttonblock">
<input class="defaultbutton" type="submit" name="CopyButton" value="{'Copy'|i18n('design/standard/content/copy')}" />
<input class="button" type="submit" name="CancelButton" value="{'Cancel'|i18n('design/standard/content/copy')}" />
</div>

{/let}

</form>
