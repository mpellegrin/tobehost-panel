<?php
/**
 * @file
 * tbh_core.features.menu_custom.inc
 */

/**
 * Implements hook_menu_default_menu_custom().
 */
function tbh_core_menu_default_menu_custom() {
  $menus = array();

  // Exported menu: menu-tbh-admin.
  $menus['menu-tbh-admin'] = array(
    'menu_name' => 'menu-tbh-admin',
    'title' => 'TBH Admin',
    'description' => 'ToBeHost admin menu',
  );
  // Translatables
  // Included for use with string extractors like potx.
  t('TBH Admin');
  t('ToBeHost admin menu');

  return $menus;
}
