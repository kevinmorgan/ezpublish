<select name="{$id_name}">
{section name=combobox loop=$list}
<option value="{$combobox:item.id}" {switch name=sw match=$combobox:item.id}{case match=$current}selected{/case}{case/}{/switch}>{$combobox:item.name}</option>
{/section}
</select>
