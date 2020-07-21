-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC. All rights reserved.                        |
-- |                                                                    |
-- | This work is published under the GNU AGPLv3 license with some      |
-- | permitted exceptions and without any warranty. For full license    |
-- | and copyright information, see https://civicrm.org/licensing       |
-- +--------------------------------------------------------------------+
--
-- Generated from drop.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--
-- /*******************************************************
-- *
-- * Clean up the exisiting tables
-- *
-- *******************************************************/

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `civicrm_grant_app_page`;

DELETE  civicrm_option_value.*, civicrm_option_group.*, civicrm_msg_template.*
FROM civicrm_option_value
INNER JOIN civicrm_option_group ON  civicrm_option_value.option_group_id = civicrm_option_group.id
INNER JOIN civicrm_msg_template ON civicrm_msg_template.workflow_id = civicrm_option_value.id
WHERE civicrm_option_group.name LIKE 'msg_tpl_workflow_grant';

DELETE ca.*, cv.* FROM `civicrm_activity` ca
INNER JOIN civicrm_option_value cv ON cv.value = ca.activity_type_id
INNER JOIN civicrm_option_group cg ON cg.id = cv.option_group_id
WHERE cg.name = 'activity_type' AND cv.name = 'Grant';


DELETE ca.*, cv.* FROM `civicrm_activity` ca
INNER JOIN civicrm_option_value cv ON cv.value = ca.activity_type_id
INNER JOIN civicrm_option_group cg ON cg.id = cv.option_group_id
WHERE cg.name = 'grant_status' AND cv.name = 'Draft';


DELETE ca.*, cv.* FROM `civicrm_activity` ca
INNER JOIN civicrm_option_value cv ON cv.value = ca.activity_type_id
INNER JOIN civicrm_option_group cg ON cg.id = cv.option_group_id
WHERE cg.name = 'user_dashboard_options' AND cv.name = 'CiviGrant';


SET FOREIGN_KEY_CHECKS=1;
