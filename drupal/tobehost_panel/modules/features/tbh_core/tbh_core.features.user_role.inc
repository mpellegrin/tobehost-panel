<?php
/**
 * @file
 * tbh_core.features.user_role.inc
 */

/**
 * Implements hook_user_default_roles().
 */
function tbh_core_user_default_roles() {
  $roles = array();

  // Exported role: TBH Administrator.
  $roles['TBH Administrator'] = array(
    'name' => 'TBH Administrator',
    'weight' => 2,
  );

  // Exported role: TBH Moderator.
  $roles['TBH Moderator'] = array(
    'name' => 'TBH Moderator',
    'weight' => 3,
  );

  return $roles;
}
