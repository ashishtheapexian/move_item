prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>37181779490747874089
,p_default_application_id=>65172
,p_default_id_offset=>21810712866363894224
,p_default_owner=>'ASHISH_ME'
);
end;
/
 
prompt APPLICATION 65172 - Extended Grid toolbar TEST
--
-- Application Export:
--   Application:     65172
--   Name:            Extended Grid toolbar TEST
--   Date and Time:   18:27 Wednesday March 4, 2020
--   Exported By:     ASHISH
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 29800525409485334707
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/move_item_to_nav_bar
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(29800525409485334707)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'MOVE_ITEM_TO_NAV_BAR'
,p_display_name=>'Move Item to Nav'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#move_item.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function f_render_plugin (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin)',
'  return apex_plugin.t_dynamic_action_render_result',
'is',
'  v_return apex_plugin.t_dynamic_action_render_result;',
'begin',
'  -- return',
'  v_return.javascript_function := ''move_item.init'';',
'  v_return.attribute_01        := p_dynamic_action.attribute_01; -- item',
'  v_return.attribute_02        := p_dynamic_action.attribute_02; -- Position',
'  v_return.attribute_03        := p_dynamic_action.attribute_03; --Alignment nav bar',
'  v_return.attribute_04        := p_dynamic_action.attribute_04; -- Nav_Menu_alignment',
'  v_return.attribute_15        := p_dynamic_action.attribute_15; -- background Color',
'  ',
'  return v_return;',
'end;'))
,p_api_version=>2
,p_render_function=>'f_render_plugin'
,p_standard_attributes=>'REGION:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Dynamic Action Plugin that enables you to declaratively define IG toolbar buttons.'
,p_version_identifier=>'1.0.4'
,p_about_url=>'https://apex.oracle.com/pls/apex/f?p=93690'
,p_plugin_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'v1.0.0 -- Button are available with Custom and Grid action added in configurations',
''))
,p_files_version=>109
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(29800525613721334711)
,p_plugin_id=>wwv_flow_api.id(29800525409485334707)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item '
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>'Choose one of default IG toolbar groups. With this plugin you can add button to the start or end of the group.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(29806240862135969250)
,p_plugin_id=>wwv_flow_api.id(29800525409485334707)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'Navigation bar'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(29806446991233523723)
,p_plugin_attribute_id=>wwv_flow_api.id(29806240862135969250)
,p_display_sequence=>10
,p_display_value=>'Nav bar'
,p_return_value=>'nav-bar'
,p_help_text=>'Navigation bar'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(29810275511338172731)
,p_plugin_attribute_id=>wwv_flow_api.id(29806240862135969250)
,p_display_sequence=>20
,p_display_value=>'Navigation Menu'
,p_return_value=>'nav-menu'
,p_help_text=>'Navigation Menu'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(29814348190966881420)
,p_plugin_attribute_id=>wwv_flow_api.id(29806240862135969250)
,p_display_sequence=>30
,p_display_value=>'Application Title'
,p_return_value=>'app-title'
,p_help_text=>'Application Title'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(29808667450731143681)
,p_plugin_id=>wwv_flow_api.id(29800525409485334707)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Alignment'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'right'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(29806240862135969250)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'nav-bar,app-title'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(29809396022743665774)
,p_plugin_attribute_id=>wwv_flow_api.id(29808667450731143681)
,p_display_sequence=>10
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(29809126988211697614)
,p_plugin_attribute_id=>wwv_flow_api.id(29808667450731143681)
,p_display_sequence=>20
,p_display_value=>'Left'
,p_return_value=>'left'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(29809501660721671827)
,p_plugin_id=>wwv_flow_api.id(29800525409485334707)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Alignment'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'top'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(29806240862135969250)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'nav-menu'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(29809507928891673122)
,p_plugin_attribute_id=>wwv_flow_api.id(29809501660721671827)
,p_display_sequence=>10
,p_display_value=>'Top'
,p_return_value=>'top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(29809509781525674501)
,p_plugin_attribute_id=>wwv_flow_api.id(29809501660721671827)
,p_display_sequence=>20
,p_display_value=>'Bottom'
,p_return_value=>'bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(29809526445656681046)
,p_plugin_id=>wwv_flow_api.id(29800525409485334707)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Background Color'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210D0A202A20617065782D4974656D204D76656D656E74202D204F7261636C65204150455820706C7567696E0D0A202A2040617574686F72204173686973682053616861790D0A202A204076657273696F6E2076312E302E300D0A202A20406C696E';
wwv_flow_api.g_varchar2_table(2) := '6B2068747470733A2F2F6769746875622E636F6D2F6173686973687468656170657869616E2F617065785F6974656D5F6D6F76652E6769740D0A202A20406C6963656E7365204D49540D0A202A2F0D0A2F2A0D0A202A2043686167654C6F673A0D0A202A';
wwv_flow_api.g_varchar2_table(3) := '2076312E302E30202D203230323030333034202D20496E697469616C2052656C656173650D0A202A2F0D0A0D0A766172206D6F76655F6974656D203D207B0D0A0D0A202020202F2A20496E69742046756E6374696F6E2A2F0D0A20202020696E69743A20';
wwv_flow_api.g_varchar2_table(4) := '66756E6374696F6E202829207B0D0A2020202020202020766172206461203D20746869733B0D0A2020202020202020617065782E64656275672E6C6F6728276D6F76655F6974656D2E696E6974272C206461293B0D0A0D0A20202020202020202F2A2067';
wwv_flow_api.g_varchar2_table(5) := '657420706C7567696E20617474726962757465732A2F0D0A202020202020202076617220765F6974656D4964203D2064612E616374696F6E2E61747472696275746530313B0D0A20202020202020207661722076506F736974696F6E203D2064612E6163';
wwv_flow_api.g_varchar2_table(6) := '74696F6E2E61747472696275746530323B0D0A20202020202020207661722076416C69676E6D656E74203D2064612E616374696F6E2E61747472696275746530333B0D0A202020202020202076617220764E61765F4D656E755F616C69676E6D656E7420';
wwv_flow_api.g_varchar2_table(7) := '3D2064612E616374696F6E2E61747472696275746530343B0D0A202020202020202076617220766261636B67726F756E64203D2064612E616374696F6E2E61747472696275746531353B0D0A0D0A20202020202020202428272327202B20765F6974656D';
wwv_flow_api.g_varchar2_table(8) := '4964292E63737328276261636B67726F756E64272C20766261636B67726F756E64293B0D0A0D0A2020202020202020766172206C5F6974656D203D202428272327202B20765F6974656D4964292E64657461636828293B0D0A2020202020202020766172';
wwv_flow_api.g_varchar2_table(9) := '206C5F706F733B0D0A20202020202020206966202876506F736974696F6E203D3D20276E61762D6261722729207B0D0A2020202020202020202020206C5F706F73203D202428272E742D4E617669676174696F6E42617227293B0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(10) := '202020206966202876416C69676E6D656E74203D3D20276C6566742729207B0D0A2020202020202020202020202020202024286C5F706F73292E70726570656E64286C5F6974656D293B0D0A2020202020202020202020207D20656C7365207B0D0A2020';
wwv_flow_api.g_varchar2_table(11) := '202020202020202020202020202024286C5F706F73292E617070656E64286C5F6974656D293B0D0A2020202020202020202020207D0D0A20202020202020207D20656C7365206966202876506F736974696F6E203D3D20276E61762D6D656E752729207B';
wwv_flow_api.g_varchar2_table(12) := '0D0A2020202020202020202020206C5F706F73203D202428272E742D547265654E617627293B0D0A20202020202020202020202069662028764E61765F4D656E755F616C69676E6D656E74203D3D2027746F702729207B0D0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(13) := '202020202024286C5F706F73292E70726570656E64286C5F6974656D293B0D0A2020202020202020202020207D20656C7365207B0D0A2020202020202020202020202020202024286C5F706F73292E617070656E64286C5F6974656D293B0D0A0D0A2020';
wwv_flow_api.g_varchar2_table(14) := '202020202020202020207D0D0A20202020202020207D20656C7365206966202876506F736974696F6E203D3D20276170702D7469746C652729207B0D0A2020202020202020202020206C5F706F73203D202428272E742D4865616465722D6C6F676F2729';
wwv_flow_api.g_varchar2_table(15) := '3B0D0A2020202020202020202020206966202876416C69676E6D656E74203D3D20276C6566742729207B0D0A2020202020202020202020202020202024286C5F706F73292E70726570656E64286C5F6974656D293B0D0A2020202020202020202020207D';
wwv_flow_api.g_varchar2_table(16) := '20656C7365207B0D0A2020202020202020202020202020202024286C5F706F73292E617070656E64286C5F6974656D293B0D0A2020202020202020202020207D0D0A20202020202020207D0D0A20202020202020202428272327202B20765F6974656D49';
wwv_flow_api.g_varchar2_table(17) := '64202B20275F434F4E5441494E455227292E72656D6F766528293B202F2F20636F6E74656E7461696E657220646F6573206E6F74207265717569726520666F72206E6F770D0A202020207D0D0A7D0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(29805692200091940555)
,p_plugin_id=>wwv_flow_api.id(29800525409485334707)
,p_file_name=>'move_item.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
