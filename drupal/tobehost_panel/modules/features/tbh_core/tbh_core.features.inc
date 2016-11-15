<?php
/**
 * @file
 * tbh_core.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function tbh_core_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_eck_entity_type_info().
 */
function tbh_core_eck_entity_type_info() {
  $items = array(
    'tbh_services' => array(
      'name' => 'tbh_services',
      'label' => 'TBH Services',
      'properties' => array(
        'uid' => array(
          'label' => 'Author',
          'type' => 'integer',
          'behavior' => 'author',
        ),
        'created' => array(
          'label' => 'Created',
          'type' => 'integer',
          'behavior' => 'created',
        ),
        'changed' => array(
          'label' => 'Changed',
          'type' => 'integer',
          'behavior' => 'changed',
        ),
      ),
    ),
  );
  return $items;
}
