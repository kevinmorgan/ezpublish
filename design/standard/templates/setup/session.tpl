{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<SCRIPT LANGUAGE="JavaScript" type="text/javascript">
{literal}
<!--
function checkAll()
{

    if ( document.trashaction.selectall.value == "Select all" )

    {

        document.trashaction.selectall.value = "Deselect all";

        with (document.trashaction)
	{
            for (var i=0; i < elements.length; i++)
	    {
                if (elements[i].type == 'checkbox' && ( elements[i].name == 'SessionKeyArray[]' || elements[i].name == 'UserIDArray[]' ) )
                     elements[i].checked = true;
	    }
        }
     }
     else
     {

         document.trashaction.selectall.value = "Select all";

         with (document.trashaction)
	 {
            for (var i=0; i < elements.length; i++)
	    {
                if (elements[i].type == 'checkbox' && ( elements[i].name == 'SessionKeyArray[]' || elements[i].name == 'UserIDArray[]' ) )
                     elements[i].checked = false;
	    }
         }
     }
}

//-->
{/literal}
</SCRIPT>
<form name="trashaction" method="post" action={concat( '/setup/session/', cond( $user_id, concat( $user_id, '/' ), '' ), '(offset)/', $view_parameters.offset )|ezurl}>
<h1>{"Session admin"|i18n( "design/standard/setup/session" )}</h1>

{section show=$sessions_removed}
<div class="feedback">
{"The sessions were successfully removed."|i18n( "design/standard/setup/session" )}
</div>
{/section}

<div class="objectheader">
    <h2>{"Sessions"|i18n( "design/standard/setup/session" )}</h2>
</div>
<div class="object">
    <p>{"Total number of sessions"|i18n( "design/standard/setup/session" )}: {$sessions_active}<br/>
        {let logged_in_count=fetch( user, logged_in_count )
             anonymous_count=fetch( user, anonymous_count )}
        {'There are %logged_in_count registered and %anonymous_count anonymous users online.'|i18n( 'design/standard/toolbar',,
          hash( '%logged_in_count', $logged_in_count, '%anonymous_count', $anonymous_count ) )}
        {/let}
    </p>
    <p>{"Use the buttons below to delete the session entries that are present in the database."|i18n( "design/standard/setup/session" )}<br/>
       {"WARNING! When removing sessions, users that are logged in will be thrown out from the system."|i18n( "design/standard/setup/session" )}</p>

    <div class="buttonblock">
            <input type="submit" name="RemoveAllSessionsButton" value="{"Remove all sessions"|i18n( "design/standard/setup/session" )}" />&nbsp;
            <input type="submit" name="RemoveTimedOutSessionsButton" value="{"Remove timed out / old sessions"|i18n( "design/standard/setup/session" )}" />
    </div>
    {section show=$user_id}
        {let session_user=fetch( content,object, hash( 'object_id', $user_id ) )}
        <p>{'Displaying sessions for %username'|i18n( 'design/standard/setup/session',, hash( '%username', $session_user.name ) )}</p>
        {/let}
        <div class="buttonblock">
            <input type="submit" name="ShowAllUsersButton" value="{"Show from all users"|i18n( "design/standard/setup/session" )}" />
        </div>
    {section-else}
    <div class="buttonblock">
            <label>{'Sessions from'|i18n( 'design/standard/setup/session' )}</label>
            <select name="FilterType">
                <option value="everyone"{cond( eq( $filter_type, 'everyone' ), ' selected="selected"', '' )}>{"Everyone"|i18n( "design/standard/setup/session" )}</option>
                <option value="registered"{cond( eq( $filter_type, 'registered' ), ' selected="selected"', '' )}>{"Registered users"|i18n( "design/standard/setup/session" )}</option>
                <option value="anonymous"{cond( eq( $filter_type, 'anonymous' ), ' selected="selected"', '' )}>{"Anonymous users"|i18n( "design/standard/setup/session" )}</option>
            </select>
            <input type="submit" name="ChangeFilterButton" value="{"Refresh"|i18n( "design/standard/setup/session" )}" />
    </div>
    {/section}

</div>

<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<th>
&nbsp;
</th>
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/login' )|ezurl}>{"Login"|i18n( "design/standard/setup/session" )}</a>
</th>
{section show=$user_id|not}
<th>
    {"Count"|i18n( "design/standard/setup/session" )}
</th>
{/section}
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/email' )|ezurl}>{"E-mail"|i18n( "design/standard/setup/session" )}</a>
</th>
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/name' )|ezurl}>{"Full name"|i18n( "design/standard/setup/session" )}</a>
</th>
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/idle' )|ezurl}>{"Idle time"|i18n( "design/standard/setup/session" )}</a>
</th>
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/idle' )|ezurl}>{"Idle since"|i18n( "design/standard/setup/session" )}</a>
</th>

{section var=session loop=$sessions_list sequence=array('bgdark', 'bglight')}
<tr valign="top" class="{$session.sequence}">
    {let session_user=fetch( content,object, hash( 'object_id', $session.user_id ) )}
    <td width="1%">
    {section show=$user_id}
        <input type="checkbox" name="SessionKeyArray[]" value="{$session.session_key|wash}" />
    {section-else}
        <input type="checkbox" name="UserIDArray[]" value="{$session.user_id}" />
    {/section}
    </td>
    <td width="15%">
        <a href={$session_user.main_node.url_alias|ezurl}>{$session.login}</a>
    </td>
    {section show=$user_id|not}
    <td width="1%">
        <a href={concat( 'setup/session/', $session.user_id )|ezurl}>{$session.count}</a>
    </td>
    {/section}
    <td width="15%">
        <a href="mailto:{$session.email|wash}">{$session.email|wash}</a>
    </td>
    <td width="30%">
        {$session_user.name|wash}
    </td>

    <td width="10%"> 
        {$session.idle.hour}:{$session.idle.minute}:{$session.idle.second}
    </td> 
    <td width="19%">
      {section show=or($session.idle.minute|lt(0), $session.idle.hour|lt(0))}
          {"Timescrew detected"|i18n( "design/standard/setup/session")}
      {section-else}
          {$session.idle_time|l10n( shortdatetime )}
      {/section}
    </td>

    {/let}
</tr>
{/section}
</table>
<table>
<tr>
    <td>
        <input type="submit" name="RemoveSelectedSessionsButton" value="{"Remove"|i18n( "design/standard/setup/session ")}" />
    </td>
    <td colspan="5">
        <input name="selectall" onclick=checkAll() type="button" value="Select all">
    </td>
</tr>
</table>

    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=concat( '/setup/session', cond( $user_id, concat( '/', $user_id ), '' ) )
             item_count=$sessions_count
             view_parameters=$view_parameters
             item_limit=$page_limit}

</form>
