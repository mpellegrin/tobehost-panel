<?php
/**
 * @file
 * tbh_sql_mariadb.features.field_base.inc
 */

/**
 * Implements hook_field_default_field_bases().
 */
function tbh_sql_mariadb_field_default_field_bases() {
  $field_bases = array();

  // Exported field_base: 'field_tbh_sql_name'.
  $field_bases['field_tbh_sql_name'] = array(
    'active' => 1,
    'cardinality' => 1,
    'deleted' => 0,
    'entity_types' => array(),
    'field_name' => 'field_tbh_sql_name',
    'indexes' => array(
      'format' => array(
        0 => 'format',
      ),
    ),
    'locked' => 0,
    'module' => 'text',
    'settings' => array(
      'max_length' => 10,
    ),
    'translatable' => 0,
    'type' => 'text',
  );

  // Exported field_base: 'field_tbh_sql_password'.
  $field_bases['field_tbh_sql_password'] = array(
    'active' => 1,
    'cardinality' => 1,
    'deleted' => 0,
    'entity_types' => array(),
    'field_name' => 'field_tbh_sql_password',
    'indexes' => array(
      'format' => array(
        0 => 'format',
      ),
    ),
    'locked' => 0,
    'module' => 'text',
    'settings' => array(
      'max_length' => 64,
    ),
    'translatable' => 0,
    'type' => 'text',
  );

  return $field_bases;
}
