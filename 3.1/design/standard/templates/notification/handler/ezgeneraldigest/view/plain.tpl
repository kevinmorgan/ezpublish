{set-block scope=root variable=subject}{'[%sitename] Digest for %date'
                                        |i18n("design/standard/notification",,
                                              hash('%date',currentdate()|l10n(datetime),
                                                   '%sitename',ezini("SiteSettings","SiteURL")))}{/set-block}
{"This digest email is to inform you on new items at %sitename."
 |i18n('design/standard/notification',,
       hash('%sitename',ezini("SiteSettings","SiteURL")))}

{section name=Handlers loop=fetch(notification,digest_handlers,hash(date,$date.timestamp,address,$address))}

{include handler=$Handlers:item date=$date address=$address uri=concat( "design:notification/handler/",$Handlers:item.id_string,"/view/digest_plain.tpl")}

{/section}


{"If you do not wish to continue receiving these notifications,
change your settings at:"|i18n('design/standard/notification')}
http://{ezini("SiteSettings","SiteURL")}{concat("notification/settings/")|ezurl(no)}

-- 
{"%sitename notification system"
 |i18n('design/standard/notification',,
       hash('%sitename',ezini("SiteSettings","SiteURL")))}
