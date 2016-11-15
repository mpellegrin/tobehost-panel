<?php
/**
 * @file
 * tbh_sql_mariadb.features.user_permission.inc
 */

/**
 * Implements hook_user_default_permissions().
 */
function tbh_sql_mariadb_user_default_permissions() {
  $permissions = array();

  // Exported permission: 'eck add tbh_services tbh_sql_mariadb entities'.
  $permissions['eck add tbh_services tbh_sql_mariadb entities'] = array(
    'name' => 'eck add tbh_services tbh_sql_mariadb entities',
    'roles' => array(),
    'module' => 'eck',
  );

  // Exported permission: 'eck administer tbh_services tbh_sql_mariadb entities'.
  $permissions['eck administer tbh_services tbh_sql_mariadb entities'] = array(
    'name' => 'eck administer tbh_services tbh_sql_mariadb entities',
    'roles' => array(),
    'module' => 'eck',
  );

  // Exported permission: 'eck delete tbh_services tbh_sql_mariadb entities'.
  $permissions['eck delete tbh_services tbh_sql_mariadb entities'] = array(
    'name' => 'eck delete tbh_services tbh_sql_mariadb entities',
    'roles' => array(),
    'module' => 'eck',
  );

  // Exported permission: 'eck edit tbh_services tbh_sql_mariadb entities'.
  $permissions['eck edit tbh_services tbh_sql_mariadb entities'] = array(
    'name' => 'eck edit tbh_services tbh_sql_mariadb entities',
    'roles' => array(),
    'module' => 'eck',
  );

  // Exported permission: 'eck list tbh_services tbh_sql_mariadb entities'.
  $permissions['eck list tbh_services tbh_sql_mariadb entities'] = array(
    'name' => 'eck list tbh_services tbh_sql_mariadb entities',
    'roles' => array(),
    'module' => 'eck',
  );

  // Exported permission: 'eck view tbh_services tbh_sql_mariadb entities'.
  $permissions['eck view tbh_services tbh_sql_mariadb entities'] = array(
    'name' => 'eck view tbh_services tbh_sql_mariadb entities',
    'roles' => array(),
    'module' => 'eck',
  );

  return $permissions;
}
