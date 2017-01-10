<?php
/**
 * @file
 * tbh_web_apache.views_default.inc
 */

/**
 * Implements hook_views_default_views().
 */
function tbh_web_apache_views_default_views() {
  $export = array();

  $view = new view();
  $view->name = 'tbh_puppet_web';
  $view->description = '';
  $view->tag = 'default';
  $view->base_table = 'eck_tbh_services';
  $view->human_name = 'TBH Puppet Web';
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
  /* Field: TBH Services: Enable PHP */
  $handler->display->display_options['fields']['field_tbh_web_php']['id'] = 'field_tbh_web_php';
  $handler->display->display_options['fields']['field_tbh_web_php']['table'] = 'field_data_field_tbh_web_php';
  $handler->display->display_options['fields']['field_tbh_web_php']['field'] = 'field_tbh_web_php';
  $handler->display->display_options['fields']['field_tbh_web_php']['label'] = 'tbh_web_php';
  $handler->display->display_options['fields']['field_tbh_web_php']['element_label_colon'] = FALSE;
  /* Field: TBH Services: FTP password */
  $handler->display->display_options['fields']['field_tbh_web_password']['id'] = 'field_tbh_web_password';
  $handler->display->display_options['fields']['field_tbh_web_password']['table'] = 'field_data_field_tbh_web_password';
  $handler->display->display_options['fields']['field_tbh_web_password']['field'] = 'field_tbh_web_password';
  $handler->display->display_options['fields']['field_tbh_web_password']['label'] = 'tbh_ftp_password';
  $handler->display->display_options['fields']['field_tbh_web_password']['element_label_colon'] = FALSE;
  /* Filter criterion: TBH Services: tbh_services type */
  $handler->display->display_options['filters']['type']['id'] = 'type';
  $handler->display->display_options['filters']['type']['table'] = 'eck_tbh_services';
  $handler->display->display_options['filters']['type']['field'] = 'type';
  $handler->display->display_options['filters']['type']['value'] = array(
    'tbh_web_apache' => 'tbh_web_apache',
  );
  $export['tbh_puppet_web'] = $view;

  return $export;
}
