<?php
/**
 * @file
 * tbh_sql_mariadb.features.field_instance.inc
 */

/**
 * Implements hook_field_default_field_instances().
 */
function tbh_sql_mariadb_field_default_field_instances() {
  $field_instances = array();

  // Exported field_instance: 'tbh_services-tbh_sql_mariadb-field_tbh_sql_name'.
  $field_instances['tbh_services-tbh_sql_mariadb-field_tbh_sql_name'] = array(
    'bundle' => 'tbh_sql_mariadb',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => 'The database name. Will also be used to create the user that will connect to database.',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'text',
        'settings' => array(),
        'type' => 'text_default',
        'weight' => 0,
      ),
      'teaser' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'entity_type' => 'tbh_services',
    'field_name' => 'field_tbh_sql_name',
    'label' => 'Name',
    'required' => 1,
    'settings' => array(
      'text_processing' => 0,
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'text',
      'settings' => array(
        'size' => 10,
      ),
      'type' => 'text_textfield',
      'weight' => 1,
    ),
  );

  // Exported field_instance:
  // 'tbh_services-tbh_sql_mariadb-field_tbh_sql_password'.
  $field_instances['tbh_services-tbh_sql_mariadb-field_tbh_sql_password'] = array(
    'bundle' => 'tbh_sql_mariadb',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => 'The password for the user that will connect to database. Please use a strong password as you will not type it every day.',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'text',
        'settings' => array(),
        'type' => 'text_default',
        'weight' => 1,
      ),
      'teaser' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'entity_type' => 'tbh_services',
    'field_name' => 'field_tbh_sql_password',
    'label' => 'Password',
    'required' => 1,
    'settings' => array(
      'text_processing' => 0,
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'text',
      'settings' => array(
        'size' => 60,
      ),
      'type' => 'text_textfield',
      'weight' => 2,
    ),
  );

  // Translatables
  // Included for use with string extractors like potx.
  t('Name');
  t('Password');
  t('The database name. Will also be used to create the user that will connect to database.');
  t('The password for the user that will connect to database. Please use a strong password as you will not type it every day.');

  return $field_instances;
}
