<div class="element">
{let selectedSections=$event.selected_sections}
<label>{"Sections"|i18n("design/standard/workflow/eventtype/edit")}</label><div class="labelbreak"></div>
<select name="WorkflowEvent_event_ezmultiplexer_section_ids_{$event.id}[]" size="5" multiple >
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
{let selectedClasses=$event.selected_classes}
<label>{"Classes to run workflow"|i18n("design/standard/workflow/eventtype/edit")}</label><div class="labelbreak"></div>
<select name="WorkflowEvent_event_ezmultiplexer_class_ids_{$event.id}[]" size="5" multiple >
<option value="-1" 
{switch match=-1}
{case in=$selectedClasses}
  selected="selected"
{/case}
{case}
{/case} 
{/switch}
>{"Any"|i18n("design/standard/workflow/eventtype/edit")}</option>
{section name=Classes loop=$event.workflow_type.contentclass_list}
  <option value="{$Classes:item.value}"
  {switch match=$Classes:item.value}
  {case in=$selectedClasses}
    selected="selected"
  {/case}
  {case}
  {/case} 
  {/switch}

  >{$Classes:item.value}-{$Classes:item.Name}</option>
{/section}   
{/let} 
</select>
</div>

<div class="element">
{let selectedGroups=$event.selected_usergroups}
<label>{"Users without workflow IDs"|i18n("design/standard/workflow/eventtype/edit")}</label><div class="labelbreak"></div>
<select name="WorkflowEvent_event_ezmultiplexer_not_run_ids_{$event.id}[]" size="5" multiple >
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

{/let}
</select>
</div>

<div class="element">
{let selectedWorkflow=$event.selected_workflow}
<label>{"Workflow to run"|i18n("design/standard/workflow/eventtype/edit")}</label><div class="labelbreak"></div>
<select name="WorkflowEvent_event_ezmultiplexer_workflow_id_{$event.id}">
{section name=Workflows loop=$event.workflow_type.workflow_list}
  <option value="{$Workflows:item.value}"
  {section show=eq( $Workflows:item.value, $selectedWorkflow )}
    selected="selected"
  {/section}

  >{$Workflows:item.value}-{$Workflows:item.Name}</option>
{/section}

{/let}
</select>
</div>
