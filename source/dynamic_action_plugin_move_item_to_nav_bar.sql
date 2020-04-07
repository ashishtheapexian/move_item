set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.0.00.31'
,p_default_workspace_id=>1670348347102790
,p_default_application_id=>102
,p_default_owner=>'APEX_5'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/move_item_to_nav_bar
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(5385635944728312)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'MOVE_ITEM_TO_NAV_BAR'
,p_display_name=>'Move Item to Nav'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#move_item.js'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
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
'  v_return.attribute_05        := p_dynamic_action.attribute_05; -- background Color',
'  ',
'  return v_return;',
'end;'))
,p_render_function=>'f_render_plugin'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'Dynamic Action Plugin to move item',
'Supported Version APEX 5 and above'))
,p_version_identifier=>'1.0.5'
,p_about_url=>'https://apex.oracle.com/pls/apex/f?p=93690'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5385892941737895)
,p_plugin_id=>wwv_flow_api.id(5385635944728312)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5386107204744889)
,p_plugin_id=>wwv_flow_api.id(5385635944728312)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'nav-bar'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5386406585747135)
,p_plugin_attribute_id=>wwv_flow_api.id(5386107204744889)
,p_display_sequence=>10
,p_display_value=>'Nav bar'
,p_return_value=>'nav-bar'
,p_help_text=>'Navigation Bar'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5386828922749000)
,p_plugin_attribute_id=>wwv_flow_api.id(5386107204744889)
,p_display_sequence=>20
,p_display_value=>'Navigation Menu'
,p_return_value=>'nav-menu'
,p_help_text=>'Navigation Menu'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5387293065751381)
,p_plugin_attribute_id=>wwv_flow_api.id(5386107204744889)
,p_display_sequence=>30
,p_display_value=>'Application Title'
,p_return_value=>'app-title'
,p_help_text=>'Application Title'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5387887319760053)
,p_plugin_id=>wwv_flow_api.id(5385635944728312)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Alignment'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'right'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5386107204744889)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'nav-bar,app-title'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5388171205761317)
,p_plugin_attribute_id=>wwv_flow_api.id(5387887319760053)
,p_display_sequence=>10
,p_display_value=>'Right'
,p_return_value=>'right'
,p_help_text=>'Right'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5388531571762106)
,p_plugin_attribute_id=>wwv_flow_api.id(5387887319760053)
,p_display_sequence=>20
,p_display_value=>'Left'
,p_return_value=>'left'
,p_help_text=>'Left'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5389168413771754)
,p_plugin_id=>wwv_flow_api.id(5385635944728312)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Alignment'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'top'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(5386107204744889)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'nav-menu'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5389465215772835)
,p_plugin_attribute_id=>wwv_flow_api.id(5389168413771754)
,p_display_sequence=>10
,p_display_value=>'Top'
,p_return_value=>'top'
,p_help_text=>'Top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5389849782773779)
,p_plugin_attribute_id=>wwv_flow_api.id(5389168413771754)
,p_display_sequence=>20
,p_display_value=>'Bottom'
,p_return_value=>'bottom'
,p_help_text=>'Bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5390402572779943)
,p_plugin_id=>wwv_flow_api.id(5385635944728312)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Background Color'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '766172206D6F76655F6974656D3D7B696E69743A66756E6374696F6E28297B7661722064613D746869733B617065782E64656275672E6C6F6728276D6F76655F6974656D2E696E6974272C6461293B76617220765F6974656D49643D64612E616374696F';
wwv_flow_api.g_varchar2_table(2) := '6E2E61747472696275746530313B7661722076506F736974696F6E3D64612E616374696F6E2E61747472696275746530323B7661722076416C69676E6D656E743D64612E616374696F6E2E61747472696275746530333B76617220764E61765F4D656E75';
wwv_flow_api.g_varchar2_table(3) := '5F616C69676E6D656E743D64612E616374696F6E2E61747472696275746530343B76617220766261636B67726F756E643D64612E616374696F6E2E61747472696275746530353B24282723272B765F6974656D4964292E63737328276261636B67726F75';
wwv_flow_api.g_varchar2_table(4) := '6E64272C766261636B67726F756E64293B766172206C5F6974656D3D24282723272B765F6974656D4964292E64657461636828293B766172206C5F706F733B69662876506F736974696F6E3D3D276E61762D62617227297B6C5F706F733D2428272E742D';
wwv_flow_api.g_varchar2_table(5) := '4E617669676174696F6E42617227293B69662876416C69676E6D656E743D3D276C65667427297B24286C5F706F73292E70726570656E64286C5F6974656D297D656C73657B24286C5F706F73292E617070656E64286C5F6974656D297D7D656C73652069';
wwv_flow_api.g_varchar2_table(6) := '662876506F736974696F6E3D3D276E61762D6D656E7527297B6C5F706F733D2428272E742D547265654E617627293B696628764E61765F4D656E755F616C69676E6D656E743D3D27746F7027297B24286C5F706F73292E70726570656E64286C5F697465';
wwv_flow_api.g_varchar2_table(7) := '6D297D656C73657B24286C5F706F73292E617070656E64286C5F6974656D297D7D656C73652069662876506F736974696F6E3D3D276170702D7469746C6527297B6C5F706F733D2428272E742D4865616465722D6C6F676F27293B69662876416C69676E';
wwv_flow_api.g_varchar2_table(8) := '6D656E743D3D276C65667427297B24286C5F706F73292E70726570656E64286C5F6974656D297D656C73657B24286C5F706F73292E617070656E64286C5F6974656D297D7D0D0A24282723272B765F6974656D49642B275F434F4E5441494E455227292E';
wwv_flow_api.g_varchar2_table(9) := '72656D6F766528297D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(5390941199801245)
,p_plugin_id=>wwv_flow_api.id(5385635944728312)
,p_file_name=>'move_item.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
