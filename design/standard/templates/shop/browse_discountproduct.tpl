<div class="maincontentheader">
<h1>
    {'Choose product for discount'
     |i18n('design/standard/shop/view')}
</h1>
</div>

<p>
    {"Please choose the products you want to add to discount rule %discountname in discount group %groupname.

    Select your products and click the %buttonname button.
    Using the recent and bookmark items for quick selection is also possible.
    Click on product names to change the browse listing."
    |i18n('design/standard/shop/view',,
          hash('%discountname',$browse.content.discountrule_id,
               '%groupname',$browse.content.discountgroup_id,
               '%buttonname','Select'|i18n('design/standard/content/view')))
    |nl2br}
</p>
{/let}