<form action={concat($module.functions.discountruleedit.uri,"/",$discountgroup_id,"/",$discountrule.id)|ezurl} method="post" name="DiscountRuleEdit">

<div class="maincontentheader">
    <h1>{"Editing rule"|i18n("design/standard/shop")}</h1>
</div>

<div class="objectheader">
    <h2>{'Attributes'|i18n('design/standard/shop')}</h2>
</div>
<div class="object">
    <div class="block">
        <label>{"Name"|i18n("design/standard/shop")}</label><div class="labelbreak"></div>
        <input type="text" name="discountrule_name" value="{$discountrule.name}" size=40>
    </div>
    <div class="block">
        <label>{"Discount percent"|i18n("design/standard/shop")}</label><div class="labelbreak"></div>
        <input type="text" name="discountrule_percent" value="{$discountrule.discount_percent}" size="4" />%
    </div>
</div>


<div class="objectheader">
    <h2>{'Rule settings'|i18n('design/standard/shop')}</h2>
</div>
<div class="object">
    <p>{"Choose which classes, sections or objects ( products ) applied to this sub rule, 'Any' means the rule will applied to all."|i18n("design/standard/shop")}</p>
    <div class="block">
        <div class="element">
             <label>{"Class"|i18n("design/standard/shop")}</label><div class="labelbreak"></div>
             <select name="Contentclasses[]" size="5" multiple="multiple" >
                 <option value="-1" {section show=$class_any_selected}selected="selected"{/section} >{"Any"|i18n("design/standard/shop")}</option>
                 {section name=Classes loop=$product_class_list}
                     <option value="{$Classes:item.id}" {switch match=$Classes:item.id}{case in=$class_limitation_list} selected="selected"{/case}{case/}{/switch}>
                         {$Classes:item.name|wash}
                     </option>
                 {/section}
             </select>
        </div>

        <div class="element">
            <label>{"Section"|i18n("design/standard/shop")}</label><div class="labelbreak"></div>
            <select name="Sections[]" size="5" multiple="multiple" >
                 <option value="-1" {section show=$section_any_selected}selected="selected"{/section}>{"Any"|i18n("design/standard/shop")}</option>
                 {section name=Sections loop=$section_list}
                     <option value="{$Sections:item.id}" {switch match=$Sections:item.id}{case in=$section_limitation_list} selected="selected"{/case}{case/}{/switch}>
                        {$Sections:item.name|wash}
                    </option>
                 {/section}
            </select>
        </div>

        <div class="element">
             <label>{"Object"|i18n("design/standard/shop")}</label><div class="labelbreak"></div>
             <table>
             {section show=$product_list name=Products loop=$product_list}
             <tr>
                 <td>
                     {$Products:item.name|wash}
                 </td>
                 <td>
                     <input type="checkbox" name="DeleteProductIDArray[]" value="{$Products:item.id}" />
                 </td>
             </tr>
             {section-else}
             <tr>
                 <td>
                     {'Not specified.'|i18n('design/standard/shop')}
                 </td>
             </tr>
             {/section}
             </table>
             <div class="buttonblock">
                 <input class="menubutton" type="image" name="BrowseProductButton" value="{'Find'|i18n('design/standard/shop')}" src={"find.png"|ezimage} />
                 {section show=$product_list}
                     <input class="menubutton" type="image" name="DeleteProductButton" value="{'Remove'|i18n('design/standard/shop')}" src={"trash.png"|ezimage} />
                 {/section}
             </div>
        </div>

        <div class="break"></div>
    </div>
</div>

<div class="buttonblock">
    {include uri="design:gui/defaultbutton.tpl" name=Store id_name=StoreButton value="Store"|i18n("design/standard/shop")}
    {include uri="design:gui/button.tpl" name=Discard id_name=DiscardButton value="Discard"|i18n("design/standard/shop")}
</div>

</form>