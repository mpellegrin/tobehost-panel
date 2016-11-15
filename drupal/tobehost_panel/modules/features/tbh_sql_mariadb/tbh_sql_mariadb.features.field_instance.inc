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

  // Exported field_instance: 'tbh_services-tbh_web_apache-field_tbh_web_id'.
  $field_instances['tbh_services-tbh_web_apache-field_tbh_web_id'] = array(
    'bundle' => 'tbh_web_apache',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => 'The unique identifier of your site. Can only contain alphanumeric characters, underscores and dashes.

It will also be used to create your free domain name.',
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
    'field_name' => 'field_tbh_web_id',
    'label' => 'Site ID',
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
      'weight' => 1,
    ),
  );

  // Exported field_instance:
  // 'tbh_services-tbh_web_apache-field_tbh_web_password'.
  $field_instances['tbh_services-tbh_web_apache-field_tbh_web_password'] = array(
    'bundle' => 'tbh_web_apache',
    'default_value' => NULL,
    'deleted' => 0,
    'description' => 'The password you will use to send your files online. The password is not stored in plain text.',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'text',
        'settings' => array(),
        'type' => 'text_default',
        'weight' => 2,
      ),
      'teaser' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'entity_type' => 'tbh_services',
    'field_name' => 'field_tbh_web_password',
    'label' => 'FTP password',
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

  // Exported field_instance: 'tbh_services-tbh_web_apache-field_tbh_web_php'.
  $field_instances['tbh_services-tbh_web_apache-field_tbh_web_php'] = array(
    'bundle' => 'tbh_web_apache',
    'default_value' => array(
      0 => array(
        'value' => 0,
      ),
    ),
    'deleted' => 0,
    'description' => 'Tick if you want PHP enabled on this website. PHP is required for modern CMS like Wordpress, Drupal, Joomla...',
    'display' => array(
      'default' => array(
        'label' => 'above',
        'module' => 'list',
        'settings' => array(),
        'type' => 'list_default',
        'weight' => 3,
      ),
      'teaser' => array(
        'label' => 'above',
        'settings' => array(),
        'type' => 'hidden',
        'weight' => 0,
      ),
    ),
    'entity_type' => 'tbh_services',
    'field_name' => 'field_tbh_web_php',
    'label' => 'Enable PHP',
    'required' => 0,
    'settings' => array(
      'user_register_form' => FALSE,
    ),
    'widget' => array(
      'active' => 1,
      'module' => 'options',
      'settings' => array(
        'display_label' => 1,
      ),
      'type' => 'options_onoff',
      'weight' => 3,
    ),
  );

  // Translatables
  // Included for use with string extractors like potx.
  t('Enable PHP');
  t('FTP password');
  t('Site ID');
  t('The password you will use to send your files online. The password is not stored in plain text.');
  t('The unique identifier of your site. Can only contain alphanumeric characters, underscores and dashes.

It will also be used to create your free domain name.');
  t('Tick if you want PHP enabled on this website. PHP is required for modern CMS like Wordpress, Drupal, Joomla...');

  return $field_instances;
}
