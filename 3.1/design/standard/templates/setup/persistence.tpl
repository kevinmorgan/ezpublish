{* Persistence<br/>  *}
{section name=Persistence loop=$#persistence_list}
 {section name=Item loop=$:item}
  {section show=is_array($:item)}
   {section name=ArrayElement loop=$:item}
{*    input type="hidden" name="P_{$Persistence:key|wash}-{$Persistence:Item:key|wash}[]" value="{$:item|wash}" <br/> *}
    <input type="hidden" name="P_{$Persistence:key|wash}-{$Persistence:Item:key|wash}[]" value="{$:item|wash}" />
   {/section}
  {section-else}
{*   input type="hidden" name="P_{$Persistence:key|wash}-{$:key|wash}" value="{$:item|wash}" <br/>  *}
   <input type="hidden" name="P_{$Persistence:key|wash}-{$:key|wash}" value="{$:item|wash}" />
  {/section}
 {/section}
{/section}