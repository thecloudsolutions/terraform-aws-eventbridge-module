output "eventbridge_bus_arns" {
  value       = module.eventbridge.eventbridge_bus_arns
  description = "The Amazon Resource Name (ARN) of the event bus."
}

output "eventbridge_bus_names" {
  value       = module.eventbridge.eventbridge_bus_names
  description = "The name of the event bus."
}

output "eventbridge_bus_regions" {
  value       = module.eventbridge.eventbridge_bus_regions
  description = "The Regions where the event buses are managed."
}

output "eventbridge_bus_tags_all" {
  value       = module.eventbridge.eventbridge_bus_tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "eventbridge_bus_policy_ids" {
  value       = module.eventbridge.eventbridge_bus_policy_ids
  description = "The name of the EventBridge event bus."
}

output "eventbridge_rule_ids" {
  value       = module.eventbridge.eventbridge_rule_ids
  description = "The rule IDs. Include the event bus name for rules outside the default event bus."
}

output "eventbridge_rule_names" {
  value       = module.eventbridge.eventbridge_rule_names
  description = "The names of the rules."
}

output "eventbridge_rule_arns" {
  value       = module.eventbridge.eventbridge_rule_arns
  description = "The Amazon Resource Name (ARN) of the rule."
}

output "eventbridge_rule_tags_all" {
  value       = module.eventbridge.eventbridge_rule_tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "eventbridge_archive_arns" {
  value       = module.eventbridge.eventbridge_archive_arns
  description = "The Amazon Resource Names (ARNs) of the archives."
}

output "eventbridge_connection_arns" {
  value       = module.eventbridge.eventbridge_connection_arns
  description = "The Amazon Resource Names (ARNs) of the connections."
}

output "eventbridge_connection_secret_arns" {
  value       = module.eventbridge.eventbridge_connection_secret_arns
  description = "The Secrets Manager secret ARNs associated with the connections."
}

output "eventbridge_api_destination_arns" {
  value       = module.eventbridge.eventbridge_api_destination_arns
  description = "The Amazon Resource Names (ARNs) of the API destinations."
}

output "eventbridge_endpoint_arns" {
  value       = module.eventbridge.eventbridge_endpoint_arns
  description = "The Amazon Resource Names (ARNs) of the global endpoints."
}

output "eventbridge_endpoint_urls" {
  value       = module.eventbridge.eventbridge_endpoint_urls
  description = "The URLs of the global endpoints."
}

output "cloudwatch_logs_log_group_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_log_group_arns
  description = "The Amazon Resource Name (ARN) specifying the log group. Any :* suffix added by the API, denoting all CloudWatch Log Streams under the CloudWatch Log Group, is removed for greater compatibility with other AWS services that do not accept the suffix."
}

output "cloudwatch_logs_log_group_names" {
  value       = module.cloudwatch_logs.cloudwatch_logs_log_group_names
  description = "The name of the log group."
}

output "cloudwatch_logs_anomaly_detector_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_anomaly_detector_arns
  description = "ARNs of the log anomaly detectors."
}

output "cloudwatch_logs_anomaly_detector_tags_all" {
  value       = module.cloudwatch_logs.cloudwatch_logs_anomaly_detector_tags_all
  description = "A map of tags assigned to each log anomaly detector, including those inherited from the provider default_tags configuration block."
}

output "cloudwatch_logs_data_protection_policy_document_jsons" {
  value       = module.cloudwatch_logs.cloudwatch_logs_data_protection_policy_document_jsons
  description = "Data protection policies rendered as JSON documents."
}

output "cloudwatch_logs_log_group_tags_all" {
  value       = module.cloudwatch_logs.cloudwatch_logs_log_group_tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "cloudwatch_logs_log_stream_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_log_stream_arns
  description = "The Amazon Resource Name (ARN) specifying the log stream."
}

output "cloudwatch_logs_destination_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_destination_arns
  description = "The Amazon Resource Name (ARN) specifying the log destination."
}

output "cloudwatch_logs_destination_tags_all" {
  value       = module.cloudwatch_logs.cloudwatch_logs_destination_tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "cloudwatch_logs_destination_names" {
  value       = module.cloudwatch_logs.cloudwatch_logs_destination_names
  description = "The name of the log destination."
}

output "cloudwatch_logs_metric_filter_ids" {
  value       = module.cloudwatch_logs.cloudwatch_logs_metric_filter_ids
  description = "The name of the metric filter."
}

output "cloudwatch_logs_resource_policy_ids" {
  value       = module.cloudwatch_logs.cloudwatch_logs_resource_policy_ids
  description = "The name of the CloudWatch log resource policy"
}

output "cloudwatch_logs_resource_policy_policy_scopes" {
  value       = module.cloudwatch_logs.cloudwatch_logs_resource_policy_policy_scopes
  description = "Scopes of CloudWatch Logs resource policies."
}

output "cloudwatch_logs_resource_policy_revision_ids" {
  value       = module.cloudwatch_logs.cloudwatch_logs_resource_policy_revision_ids
  description = "Revision IDs of resource-scoped CloudWatch Logs policies."
}

output "cloudwatch_logs_query_definition_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_query_definition_arns
  description = "Query definition ARNs."
}

output "cloudwatch_logs_query_definition_query_definition_ids" {
  value       = module.cloudwatch_logs.cloudwatch_logs_query_definition_query_definition_ids
  description = "The query definition ID."
}

output "cloudwatch_logs_delivery_source_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_source_arns
  description = "The Amazon Resource Names (ARNs) of the delivery sources."
}

output "cloudwatch_logs_delivery_source_names" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_source_names
  description = "The names of the delivery sources."
}

output "cloudwatch_logs_delivery_source_services" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_source_services
  description = "The AWS services sending logs."
}

output "cloudwatch_logs_delivery_source_tags_all" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_source_tags_all
  description = "Tags assigned to the delivery sources, including provider default tags."
}

output "cloudwatch_logs_delivery_destination_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_destination_arns
  description = "The Amazon Resource Names (ARNs) of the delivery destinations."
}

output "cloudwatch_logs_delivery_destination_names" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_destination_names
  description = "The names of the delivery destinations."
}

output "cloudwatch_logs_delivery_destination_tags_all" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_destination_tags_all
  description = "Tags assigned to the delivery destinations, including provider default tags."
}

output "cloudwatch_logs_delivery_arns" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_arns
  description = "The Amazon Resource Names (ARNs) of the deliveries."
}

output "cloudwatch_logs_delivery_ids" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_ids
  description = "The unique IDs of the deliveries."
}

output "cloudwatch_logs_delivery_tags_all" {
  value       = module.cloudwatch_logs.cloudwatch_logs_delivery_tags_all
  description = "Tags assigned to the deliveries, including provider default tags."
}

output "kms_key_arns" {
  value       = module.kms.kms_key_arns
  description = "The Amazon Resource Name (ARN) of the key."
}

output "kms_key_ids" {
  value       = module.kms.kms_key_ids
  description = "The globally unique identifier for the key."
}

output "kms_key_tags_all" {
  value       = module.kms.kms_key_tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "kms_alias_arns" {
  value       = module.kms.kms_alias_arns
  description = "The Amazon Resource Name (ARN) of the key alias."
}

output "kms_alias_target_key_arns" {
  value       = module.kms.kms_alias_target_key_arns
  description = "The Amazon Resource Name (ARN) of the target key identifier."
}

output "kms_key_regions" {
  value       = module.kms.kms_key_regions
  description = "Regions where the keys are managed."
}

output "kms_key_policies" {
  value       = module.kms.kms_key_policies
  description = "Map of key policy JSON documents."
}

output "kms_key_specs" {
  value       = module.kms.kms_key_specs
  description = "Types of key material."
}

output "kms_key_usages" {
  value       = module.kms.kms_key_usages
  description = "Permitted cryptographic uses of the keys."
}

output "kms_key_states" {
  value       = module.kms.kms_key_states
  description = "States of imported and existing keys."
}

output "kms_key_expiration_models" {
  value       = module.kms.kms_key_expiration_models
  description = "Whether imported key material expires."
}

output "kms_key_valid_to" {
  value       = module.kms.kms_key_valid_to
  description = "Expiration times of imported key material."
}

output "kms_alias_names" {
  value       = module.kms.kms_alias_names
  description = "Names of the key aliases."
}

output "kms_alias_name_prefixes" {
  value       = module.kms.kms_alias_name_prefixes
  description = "Prefixes used to generate the alias names."
}

output "kms_alias_target_key_ids" {
  value       = module.kms.kms_alias_target_key_ids
  description = "Identifiers of the keys associated with the aliases."
}

output "kms_alias_regions" {
  value       = module.kms.kms_alias_regions
  description = "Regions where the aliases are managed."
}

output "kms_grant_ids" {
  value       = module.kms.kms_grant_ids
  description = "Maps of grant identifiers."
}

output "kms_grant_tokens" {
  value       = module.kms.kms_grant_tokens
  description = "Maps of grant tokens."
  sensitive   = true
}

output "kms_grant_regions" {
  value       = module.kms.kms_grant_regions
  description = "Maps of grant regions."
}

output "kms_grant_key_ids" {
  value       = module.kms.kms_grant_key_ids
  description = "Maps of key IDs or ARNs to which the grants apply."
}

output "kms_grant_names" {
  value       = module.kms.kms_grant_names
  description = "Maps of grant names."
}

output "kms_grant_grantee_principals" {
  value       = module.kms.kms_grant_grantee_principals
  description = "Maps of grantee principals."
}

output "kms_grant_operations" {
  value       = module.kms.kms_grant_operations
  description = "Maps of operations permitted by the grants."
}

output "kms_grant_retiring_principals" {
  value       = module.kms.kms_grant_retiring_principals
  description = "Maps of retiring principals."
}

output "kms_grant_constraints" {
  value       = module.kms.kms_grant_constraints
  description = "Maps of encryption context constraints for the grants."
}

output "kms_replica_key_arns" {
  value       = module.kms.kms_replica_key_arns
  description = "The Amazon Resource Name (ARN) of the key."
}

output "kms_replica_key_ids" {
  value       = module.kms.kms_replica_key_ids
  description = "The globally unique identifier for the key."
}

output "kms_replica_key_regions" {
  value       = module.kms.kms_replica_key_regions
  description = "Region where the resource is managed."
}

output "kms_replica_key_policies" {
  value       = module.kms.kms_replica_key_policies
  description = "The key policy JSON document."
}

output "kms_replica_key_rotation_enabled" {
  value       = module.kms.kms_replica_key_rotation_enabled
  description = "Whether rotation is enabled for the related multi-Region keys."
}

output "kms_replica_key_specs" {
  value       = module.kms.kms_replica_key_specs
  description = "Type of key material."
}

output "kms_replica_key_usages" {
  value       = module.kms.kms_replica_key_usages
  description = "Permitted cryptographic use of the key."
}

output "kms_replica_key_enabled" {
  value       = module.kms.kms_replica_key_enabled
  description = "Whether the key is enabled."
}

output "kms_replica_key_tags_all" {
  value       = module.kms.kms_replica_key_tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "kms_replica_external_key_arns" {
  value       = module.kms.kms_replica_external_key_arns
  description = "The Amazon Resource Name (ARN) of the key."
}

output "kms_replica_external_key_ids" {
  value       = module.kms.kms_replica_external_key_ids
  description = "The globally unique identifier for the key."
}

output "kms_replica_external_key_regions" {
  value       = module.kms.kms_replica_external_key_regions
  description = "Region where the resource is managed."
}

output "kms_replica_external_key_policies" {
  value       = module.kms.kms_replica_external_key_policies
  description = "The key policy JSON document."
}

output "kms_replica_external_key_usages" {
  value       = module.kms.kms_replica_external_key_usages
  description = "Permitted cryptographic use of the key."
}

output "kms_replica_external_key_states" {
  value       = module.kms.kms_replica_external_key_states
  description = "The current state of the key."
}

output "kms_replica_external_key_expiration_models" {
  value       = module.kms.kms_replica_external_key_expiration_models
  description = "Whether the imported key material expires."
}

output "kms_replica_external_key_valid_to" {
  value       = module.kms.kms_replica_external_key_valid_to
  description = "Expiration time of the imported key material."
}

output "kms_replica_external_key_enabled" {
  value       = module.kms.kms_replica_external_key_enabled
  description = "Whether the key is enabled."
}

output "kms_replica_external_key_tags_all" {
  value       = module.kms.kms_replica_external_key_tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "kms_custom_key_store_ids" {
  value       = module.kms.kms_custom_key_store_ids
  description = "Maps of custom key store identifiers."
}

output "kms_existing_key_ids" {
  value       = module.kms.kms_existing_key_ids
  description = "The unique identifier of the resource."
}

output "kms_existing_key_arns" {
  value       = module.kms.kms_existing_key_arns
  description = "The Amazon Resource Name (ARN) of the key."
}

output "kms_existing_key_regions" {
  value       = module.kms.kms_existing_key_regions
  description = "Region where the resource is managed."
}

output "kms_existing_key_aws_account_ids" {
  value       = module.kms.kms_existing_key_aws_account_ids
  description = "AWS account that owns the key."
}

output "kms_existing_key_cloud_hsm_cluster_ids" {
  value       = module.kms.kms_existing_key_cloud_hsm_cluster_ids
  description = "CloudHSM cluster containing the key material."
}

output "kms_existing_key_creation_dates" {
  value       = module.kms.kms_existing_key_creation_dates
  description = "Creation date of the key."
}

output "kms_existing_key_custom_key_store_ids" {
  value       = module.kms.kms_existing_key_custom_key_store_ids
  description = "ID of the custom key store containing the key."
}

output "kms_existing_key_customer_master_key_specs" {
  value       = module.kms.kms_existing_key_customer_master_key_specs
  description = "Type of key material."
}

output "kms_existing_key_deletion_dates" {
  value       = module.kms.kms_existing_key_deletion_dates
  description = "Scheduled deletion date of the key."
}

output "kms_existing_key_descriptions" {
  value       = module.kms.kms_existing_key_descriptions
  description = "Description of the key."
}

output "kms_existing_key_enabled" {
  value       = module.kms.kms_existing_key_enabled
  description = "Whether the key is enabled."
}

output "kms_existing_key_expiration_models" {
  value       = module.kms.kms_existing_key_expiration_models
  description = "Whether the imported key material expires."
}

output "kms_existing_key_managers" {
  value       = module.kms.kms_existing_key_managers
  description = "Manager of the key."
}

output "kms_existing_key_specs" {
  value       = module.kms.kms_existing_key_specs
  description = "Type of key material."
}

output "kms_existing_key_states" {
  value       = module.kms.kms_existing_key_states
  description = "The current state of the key."
}

output "kms_existing_key_usages" {
  value       = module.kms.kms_existing_key_usages
  description = "Permitted cryptographic use of the key."
}

output "kms_existing_key_multi_region" {
  value       = module.kms.kms_existing_key_multi_region
  description = "Whether the key is a multi-Region key."
}

output "kms_existing_key_multi_region_configurations" {
  value       = module.kms.kms_existing_key_multi_region_configurations
  description = "Primary and replica configuration of the multi-Region key."
}

output "kms_existing_key_origins" {
  value       = module.kms.kms_existing_key_origins
  description = "Origin of the key material."
}

output "kms_existing_key_pending_deletion_window_in_days" {
  value       = module.kms.kms_existing_key_pending_deletion_window_in_days
  description = "Waiting period before deleting a multi-Region primary key."
}

output "kms_existing_key_valid_to" {
  value       = module.kms.kms_existing_key_valid_to
  description = "Expiration time of the imported key material."
}

output "kms_existing_key_xks_key_configurations" {
  value       = module.kms.kms_existing_key_xks_key_configurations
  description = "Configuration of the external key store key."
}

output "kms_public_keys" {
  value       = module.kms.kms_public_keys
  description = "Base64-encoded DER public keys."
}

output "kms_public_key_pems" {
  value       = module.kms.kms_public_key_pems
  description = "PEM-encoded public keys."
}

output "kms_public_key_arns" {
  value       = module.kms.kms_public_key_arns
  description = "ARNs of keys whose public keys were retrieved."
}

output "kms_public_key_encryption_algorithms" {
  value       = module.kms.kms_public_key_encryption_algorithms
  description = "Encryption algorithms supported by the keys."
}

output "kms_public_key_signing_algorithms" {
  value       = module.kms.kms_public_key_signing_algorithms
  description = "Signing algorithms supported by the keys."
}

output "iam_policy_document_jsons" {
  value       = module.iam.iam_policy_document_jsons
  description = "Standard JSON policy document rendered based on the arguments above."
}
