<?php
/**
 * @file
 * tbh_sql_mariadb.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function tbh_sql_mariadb_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "field_validation" && $api == "default_field_validation_rules") {
    return array("version" => "2");
  }
}

/**
 * Implements hook_views_api().
 */
function tbh_sql_mariadb_views_api($module = NULL, $api = NULL) {
  return array("api" => "3.0");
}

/**
 * Implements hook_eck_bundle_info().
 */
function tbh_sql_mariadb_eck_bundle_info() {
  $items = array(
    'tbh_services_tbh_sql_mariadb' => array(
      'machine_name' => 'tbh_services_tbh_sql_mariadb',
      'entity_type' => 'tbh_services',
      'name' => 'tbh_sql_mariadb',
      'label' => 'SQL (MariaDB)',
      'config' => array(),
    ),
  );
  return $items;
}
