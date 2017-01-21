<?php
/**
 * @file
 * tbh_web_apache.default_field_validation_rules.inc
 */

/**
 * Implements hook_default_field_validation_rule().
 */
function tbh_web_apache_default_field_validation_rule() {
  $export = array();

  $rule = new stdClass();
  $rule->disabled = FALSE; /* Edit this to true to make a default rule disabled initially */
  $rule->api_version = 2;
  $rule->rulename = 'Only alphanumerical';
  $rule->name = 'tbh_web_id_alphanumerical';
  $rule->field_name = 'field_tbh_web_id';
  $rule->col = 'value';
  $rule->entity_type = 'tbh_services';
  $rule->bundle = 'tbh_web_apache';
  $rule->validator = 'field_validation_regex_validator';
  $rule->settings = array(
    'data' => '^[a-z0-9]+$',
    'bypass' => 0,
    'roles' => array(
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
    ),
    'errors' => 0,
    'condition' => 0,
    'condition_wrapper' => array(
      'condition_field' => '',
      'condition_operator' => 'equals',
      'condition_value' => '',
    ),
  );
  $rule->error_message = 'The site ID must only contain only lowercase alphanumerical characters.';
  $export['tbh_web_id_alphanumerical'] = $rule;

  $rule = new stdClass();
  $rule->disabled = FALSE; /* Edit this to true to make a default rule disabled initially */
  $rule->api_version = 2;
  $rule->rulename = 'Only alphanumerical';
  $rule->name = 'tbh_web_password_alphanumerical';
  $rule->field_name = 'field_tbh_web_password';
  $rule->col = 'value';
  $rule->entity_type = 'tbh_services';
  $rule->bundle = 'tbh_web_apache';
  $rule->validator = 'field_validation_regex_validator';
  $rule->settings = array(
    'data' => '^[a-zA-Z0-9]+$',
    'bypass' => 0,
    'roles' => array(
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
    ),
    'errors' => 0,
    'condition' => 0,
    'condition_wrapper' => array(
      'condition_field' => '',
      'condition_operator' => 'equals',
      'condition_value' => '',
    ),
  );
  $rule->error_message = 'The site password must only contain only alphanumerical characters.';
  $export['tbh_web_password_alphanumerical'] = $rule;

  return $export;
}
