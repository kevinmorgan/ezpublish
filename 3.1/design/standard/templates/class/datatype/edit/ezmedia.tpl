<div class="block">
<label>{"Media player type"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
<select name="ContentClass_ezmedia_type_{$class_attribute.id}">
    <option value="flash" {section show=eq($class_attribute.data_text1,'flash')}selected="selected"{/section}>{"Flash"|i18n("design/standard/class/datatype")}</option>
    <option value="quick_time" {section show=eq($class_attribute.data_text1,'quick_time')}selected="selected"{/section}>{"QuickTime"|i18n("design/standard/class/datatype")}</option>
    <option value="real_player" {section show=eq($class_attribute.data_text1,'real_player')}selected="selected"{/section}>{"Real player"|i18n("design/standard/class/datatype")}</option>
    <option value="windows_media_player" {section show=eq($class_attribute.data_text1,'windows_media_player')}selected="selected"{/section}>{"Windows media player"|i18n("design/standard/class/datatype")}</option>
</select>
</div>

<div class="block">
<label>{"Max file size"|i18n("design/standard/class/datatype")}</label><div class="labelbreak"></div>
<input type="text" name="ContentClass_ezmedia_max_filesize_{$class_attribute.id}" value="{$class_attribute.data_int1}" size="5" maxlength="5" />&nbsp;<span class="normal">MB</span>
</div>