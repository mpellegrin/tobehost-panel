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

  // Exported field_base: 'field_tbh_web_id'.
  $field_bases['field_tbh_web_id'] = array(
    'active' => 1,
    'cardinality' => 1,
    'deleted' => 0,
    'entity_types' => array(),
    'field_name' => 'field_tbh_web_id',
    'field_permissions' => array(
      'type' => 0,
    ),
    'indexes' => array(
      'format' => array(
        0 => 'format',
      ),
    ),
    'locked' => 0,
    'module' => 'text',
    'settings' => array(
      'max_length' => 200,
    ),
    'translatable' => 0,
    'type' => 'text',
  );

  // Exported field_base: 'field_tbh_web_password'.
  $field_bases['field_tbh_web_password'] = array(
    'active' => 1,
    'cardinality' => 1,
    'deleted' => 0,
    'entity_types' => array(),
    'field_name' => 'field_tbh_web_password',
    'field_permissions' => array(
      'type' => 1,
    ),
    'indexes' => array(
      'format' => array(
        0 => 'format',
      ),
    ),
    'locked' => 0,
    'module' => 'text',
    'settings' => array(
      'max_length' => 127,
    ),
    'translatable' => 0,
    'type' => 'text',
  );

  // Exported field_base: 'field_tbh_web_php'.
  $field_bases['field_tbh_web_php'] = array(
    'active' => 1,
    'cardinality' => 1,
    'deleted' => 0,
    'entity_types' => array(),
    'field_name' => 'field_tbh_web_php',
    'field_permissions' => array(
      'type' => 1,
    ),
    'indexes' => array(
      'value' => array(
        0 => 'value',
      ),
    ),
    'locked' => 0,
    'module' => 'list',
    'settings' => array(
      'allowed_values' => array(
        0 => '',
        1 => '',
      ),
      'allowed_values_function' => '',
    ),
    'translatable' => 0,
    'type' => 'list_boolean',
  );

  return $field_bases;
}
