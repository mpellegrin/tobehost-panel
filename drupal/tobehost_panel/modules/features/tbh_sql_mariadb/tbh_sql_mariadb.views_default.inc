<?php
/**
 * @file
 * tbh_sql_mariadb.views_default.inc
 */

/**
 * Implements hook_views_default_views().
 */
function tbh_sql_mariadb_views_default_views() {
  $export = array();

  $view = new view();
  $view->name = 'tbh_puppet_sql';
  $view->description = '';
  $view->tag = 'default';
  $view->base_table = 'eck_tbh_services';
  $view->human_name = 'TBH Puppet SQL';
  $view->core = 7;
  $view->api_version = '3.0';
  $view->disabled = FALSE; /* Edit this to true to make a default view disabled initially */

  /* Display: Master */
  $handler = $view->new_display('default', 'Master', 'default');
  $handler->display->display_options['use_more_always'] = FALSE;
  $handler->display->display_options['access']['type'] = 'none';
  $handler->display->display_options['cache']['type'] = 'none';
  $handler->display->display_options['query']['type'] = 'views_query';
  $handler->display->display_options['exposed_form']['type'] = 'basic';
  $handler->display->display_options['pager']['type'] = 'none';
  $handler->display->display_options['pager']['options']['offset'] = '0';
  $handler->display->display_options['style_plugin'] = 'views_json';
  $handler->display->display_options['style_options']['plaintext_output'] = 1;
  $handler->display->display_options['style_options']['remove_newlines'] = 0;
  $handler->display->display_options['style_options']['jsonp_prefix'] = '';
  $handler->display->display_options['style_options']['using_views_api_mode'] = 0;
  $handler->display->display_options['style_options']['object_arrays'] = 0;
  $handler->display->display_options['style_options']['numeric_strings'] = 0;
  $handler->display->display_options['style_options']['bigint_string'] = 0;
  $handler->display->display_options['style_options']['pretty_print'] = 1;
  $handler->display->display_options['style_options']['unescaped_slashes'] = 0;
  $handler->display->display_options['style_options']['unescaped_unicode'] = 0;
  $handler->display->display_options['style_options']['char_encoding'] = array();
  /* Field: TBH Services: Id */
  $handler->display->display_options['fields']['id']['id'] = 'id';
  $handler->display->display_options['fields']['id']['table'] = 'eck_tbh_services';
  $handler->display->display_options['fields']['id']['field'] = 'id';
  $handler->display->display_options['fields']['id']['label'] = '';
  $handler->display->display_options['fields']['id']['element_label_colon'] = FALSE;
  $handler->display->display_options['fields']['id']['separator'] = '';
  /* Field: TBH Services: Name */
  $handler->display->display_options['fields']['field_tbh_sql_name']['id'] = 'field_tbh_sql_name';
  $handler->display->display_options['fields']['field_tbh_sql_name']['table'] = 'field_data_field_tbh_sql_name';
  $handler->display->display_options['fields']['field_tbh_sql_name']['field'] = 'field_tbh_sql_name';
  $handler->display->display_options['fields']['field_tbh_sql_name']['label'] = 'tbh_sql_name';
  $handler->display->display_options['fields']['field_tbh_sql_name']['element_label_colon'] = FALSE;
  /* Field: TBH Services: Password */
  $handler->display->display_options['fields']['field_tbh_sql_password']['id'] = 'field_tbh_sql_password';
  $handler->display->display_options['fields']['field_tbh_sql_password']['table'] = 'field_data_field_tbh_sql_password';
  $handler->display->display_options['fields']['field_tbh_sql_password']['field'] = 'field_tbh_sql_password';
  $handler->display->display_options['fields']['field_tbh_sql_password']['label'] = 'tbh_sql_password';
  $handler->display->display_options['fields']['field_tbh_sql_password']['element_label_colon'] = FALSE;
  /* Filter criterion: TBH Services: tbh_services type */
  $handler->display->display_options['filters']['type']['id'] = 'type';
  $handler->display->display_options['filters']['type']['table'] = 'eck_tbh_services';
  $handler->display->display_options['filters']['type']['field'] = 'type';
  $handler->display->display_options['filters']['type']['value'] = array(
    'tbh_sql_mariadb' => 'tbh_sql_mariadb',
  );
  $export['tbh_puppet_sql'] = $view;

  return $export;
}
