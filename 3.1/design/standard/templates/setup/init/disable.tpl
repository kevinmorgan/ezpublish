{*?template charset=latin1?*}
{include uri='design:setup/setup_header.tpl' setup=$setup step_header=false()}

{section show=or(eq($test.result,2),$save_result|not)}

{section show=$save_result|not}
<div class="error">
<p>
  <h2>{"Failed writing"|i18n("design/standard/setup/init")} settings/site.ini</h2>
  <ul>
    <li>{"The setup could not write to the file."|i18n("design/standard/setup/init")}</li>
  </ul>
</p>
</div>
{/section}

<p>
 {"The setup could not get write access to the"|i18n("design/standard/setup/init")} <i>settings</i> {"directory. This is required to disable the initialization. Following the instructions found in"|i18n("design/standard/setup/init")} <i>Issues</i> {"to enable write access and click the"|i18n("design/standard/setup/init")} <i>{"Try Again"|i18n("design/standard/setup/init")}</i> {"button."|i18n("design/standard/setup/init")}
</p>
<p>
 {"Optionally you may disable this manually, edit the <i>settings/site.ini</i> file and look for a line that says:"|i18n("design/standard/setup/init")}
</p>
<pre class="example">[SiteAccessSettings]
CheckValidity=true</pre>
<p>
 {"Change the second line from"|i18n("design/standard/setup/init")} <i>true</i> {"to"|i18n("design/standard/setup/init")} <i>false</i>.
</p>
<pre class="example">[SiteAccessSettings]
CheckValidity=false</pre>

<h1>{"Issues"|i18n("design/standard/setup/init")}</h1>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
{section name=Result loop=$test.results}
{section-exclude match=$:item[0]|ne(2)}
<tr>
  <td>{include uri=concat('design:setup/tests/',$:item[1],'_error.tpl') test_result=$:item result_number=$:number}</td>
</tr>

{delimiter}
<tr><td>&nbsp;</td></tr>
{/delimiter}

{/section}
</table>

<form method="post" action="{$script}">
  <div class="buttonblock">
    <input type="hidden" name="ChangeStepAction" value="" />
    <input type="hidden" name="DisableSetup" value="" />
    <input class="button" type="submit" name="StepButton_1" value="{'Try Again'|i18n('design/standard/setup/init')}" />
  </div>
  {include uri='design:setup/persistence.tpl'}
</form>

{section-else}

<p>
 {"The setup is now disabled, click"|i18n("design/standard/setup/init")} <a href={"/"|ezurl}>here</a> {"to get back to the site."|i18n("design/standard/setup/init")}
</p>

{/section}
