<?php
/**
 * @file
 * tbh_sql_mariadb.features.inc
 */

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