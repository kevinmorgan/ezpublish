{*?template charset=latin1?*}
{include uri='design:setup/setup_header.tpl' setup=$setup}

<form method="post" action="{$script}">

<p>
 {"The database was succesfully initialized. You are now ready for some post configuration of the site."|i18n("design/standard/setup/init")}
</p>
<p>
 {"Click the %1 button to start the configuration process."|i18n("design/standard/setup/init",,array(concat("<i>","Configure"|i18n("design/standard/setup/init"),"</i>")))}
</p>

  <div class="buttonblock">
    <input type="hidden" name="ChangeStepAction" value="" />
    <input class="defaultbutton" type="submit" name="StepButton_9" value="{'Configure'|i18n('design/standard/setup/init')} >>" />
  </div>
  {include uri='design:setup/persistence.tpl'}
</form>
