<h2>{"User account information"|i18n("design/standard/content/datatype")}</h2>

<div class="block">
<div class="element">
<label>{"User ID"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
<p class="box">{$attribute.content.contentobject_id}</p>
</div>
<div class="element">
<label>{"Login"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
<p class="box">{$attribute.content.login|wash(xhtml)}</p>
</div>
<div class="element">
<label>{"Email"|i18n("design/standard/content/datatype")}</label><div class="labelbreak"></div>
<p class="box">{$attribute.content.email|wash(email)}</p>
</div>
<div class="break"></div>
</div>