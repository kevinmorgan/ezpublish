

<div class="element">
 {let selectedUsers=$event.selected_users}
    <label>{"Editor"|i18n("design/standard/workflow/eventtype/edit")}</label><div class="labelbreak"></div>
     <select name="WorkflowEvent_event_ezapprove_editor_{$event.id}[]" size="5">

     {section name=Users loop=$event.workflow_type.users}
     <option value="{$Users:item.value}"



    {switch match=$Users:item.value}
      {case in=$selectedUsers}
      selected="selected"
      {/case}
      {case}
      {/case} 
      {/switch}




>{$Users:item.value}-{$Users:item.user.contentobject.name|wash}</option>
     {/section}   
{/let} 


     </select>
</div>

<div class="element">
 {let selectedSections=$event.selected_sections}
    <label>{"Sections"|i18n("design/standard/workflow/eventtype/edit")}</label><div class="labelbreak"></div>
    <select name="WorkflowEvent_event_ezapprove_section_{$event.id}[]" size="5" multiple >
     <option value="-1" 
    {switch match=-1}
      {case in=$selectedSections}
      selected="selected"
      {/case}
      {case}
      {/case} 
      {/switch}
 >{"Any"|i18n("design/standard/workflow/eventtype/edit")}</option>
     {section name=Sections loop=$event.workflow_type.sections}

    <option value="{$Sections:item.value}"  
    {switch match=$Sections:item.value}
      {case in=$selectedSections}
            selected="selected"
	          {/case}
      {case}
      {/case} 
      {/switch}
     >{$Sections:item.value}-{$Sections:item.Name}</option>
     {/section}  
{/let} 
     </select>
</div>

<div class="element">
 {let selectedGroups=$event.selected_usergroups}
 
     <label>{"Users without approval"|i18n("design/standard/workflow/eventtype/edit")}</label><div class="labelbreak"></div>
     <select name="WorkflowEvent_event_ezapprove_groups_{$event.id}[]" size="5" multiple >
     <option value="-1" 
    {switch match=-1}
      {case in=$selectedGroups}
      selected="selected"
      {/case}
      {case}
      {/case} 
      {/switch}
 >{"Any"|i18n("design/standard/workflow/eventtype/edit")}</option>
     {section name=Groups loop=$event.workflow_type.usergroups}

     <option value="{$Groups:item.value}"
    {switch match=$Groups:item.value}
      {case in=$selectedGroups}
      selected="selected"
      {/case}
      {case}
      {/case} 
      {/switch}
>{$Groups:item.value}-{$Groups:item.Name}</option>
     {/section}   

{/let}     </select>
</div>
