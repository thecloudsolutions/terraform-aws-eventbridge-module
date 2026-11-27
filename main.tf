module "eventbridge" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-eventbridge-component.git?ref=main"

  eventbridge_map = { for key, eventbridge in var.eventbridge_map :
    key => merge(eventbridge,
      {
        bus = try(eventbridge.bus, null) != null ? merge(eventbridge.bus,
          { kms_key_identifier = try(eventbridge.bus.kms_key_identifier, null) != null ? eventbridge.bus.kms_key_identifier : try(eventbridge.bus.replica_key_custom_name, null) != null ? try(module.kms.kms_replica_external_key_arns[eventbridge.bus.kms_key_custom_name][eventbridge.bus.replica_key_custom_name], module.kms.kms_replica_key_arns[eventbridge.bus.kms_key_custom_name][eventbridge.bus.replica_key_custom_name]) : try(eventbridge.bus.kms_key_custom_name, null) != null ? module.kms.kms_key_arns[eventbridge.bus.kms_key_custom_name] : null }
        ) : null

        bus_policies = { for policy_key, policy in eventbridge.bus_policies :
          policy_key => merge(policy,
            { policy = try(policy.policy, null) != null ? policy.policy : module.iam.iam_policy_document_jsons[policy.iam_custom_name][policy.policy_custom_name] }
          )
        }

        rules = { for rule_key, rule in eventbridge.rules :
          rule_key => merge(rule,
            { role_arn = try(rule.role_arn, null) != null ? rule.role_arn : try(rule.role_custom_name, null) != null ? module.iam.iam_role_arns[rule.role_custom_name] : null }
          )
        }

        targets = { for target_key, target in eventbridge.targets :
          target_key => merge(target,
            { role_arn = try(target.role_arn, null) != null ? target.role_arn : try(target.role_custom_name, null) != null ? module.iam.iam_role_arns[target.role_custom_name] : null }
          )
        }

        archives = { for archive_key, archive in eventbridge.archives :
          archive_key => merge(archive,
            { kms_key_identifier = try(archive.kms_key_identifier, null) != null ? archive.kms_key_identifier : try(archive.replica_key_custom_name, null) != null ? try(module.kms.kms_replica_external_key_arns[archive.kms_key_custom_name][archive.replica_key_custom_name], module.kms.kms_replica_key_arns[archive.kms_key_custom_name][archive.replica_key_custom_name]) : try(archive.kms_key_custom_name, null) != null ? module.kms.kms_key_arns[archive.kms_key_custom_name] : null }
          )
        }

        connections = { for connection_key, connection in eventbridge.connections :
          connection_key => merge(connection,
            { kms_key_identifier = try(connection.kms_key_identifier, null) != null ? connection.kms_key_identifier : try(connection.replica_key_custom_name, null) != null ? try(module.kms.kms_replica_external_key_arns[connection.kms_key_custom_name][connection.replica_key_custom_name], module.kms.kms_replica_key_arns[connection.kms_key_custom_name][connection.replica_key_custom_name]) : try(connection.kms_key_custom_name, null) != null ? module.kms.kms_key_arns[connection.kms_key_custom_name] : null }
          )
        }

        endpoints = { for endpoint_key, endpoint in eventbridge.endpoints :
          endpoint_key => merge(endpoint,
            { role_arn = try(endpoint.role_arn, null) != null ? endpoint.role_arn : try(endpoint.role_custom_name, null) != null ? module.iam.iam_role_arns[endpoint.role_custom_name] : null }
          )
        }
      }
    )
  }

  depends_on = [module.iam, module.kms]
}

module "cloudwatch_logs" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-cloudwatch-logs-component.git?ref=main"

  cloudwatch_logs_map = { for key, cloudwatch_logs in var.cloudwatch_logs_map :
    key =>
    merge(cloudwatch_logs,
      {
        delivery_sources = { for source_key, delivery_source in cloudwatch_logs.delivery_sources :
          source_key => merge(delivery_source,
            {
              resource_arn = try(delivery_source.resource_arn, null) != null ? delivery_source.resource_arn : module.eventbridge.eventbridge_bus_arns[delivery_source.eventbridge_custom_name]
              region       = try(delivery_source.region, null) != null ? delivery_source.region : delivery_source.resource_arn == null ? module.eventbridge.eventbridge_bus_regions[delivery_source.eventbridge_custom_name] : null
            }
          )
        }

        destinations = { for destination_key, destination in cloudwatch_logs.destinations :
          destination_key => merge(destination,
            { role_arn = try(destination.role_arn, null) != null ? destination.role_arn : try(destination.role_custom_name, null) != null ? module.iam.iam_role_arns[destination.role_custom_name] : null }
          )
        }

        subscription_filters = [for subscription_filter in cloudwatch_logs.subscription_filters :
          merge(subscription_filter,
            { role_arn = try(subscription_filter.role_arn, null) != null ? subscription_filter.role_arn : try(subscription_filter.role_custom_name, null) != null ? module.iam.iam_role_arns[subscription_filter.role_custom_name] : null }
          )
        ]

        anomaly_detectors = { for detector_key, anomaly_detector in cloudwatch_logs.anomaly_detectors :
          detector_key => merge(anomaly_detector,
            { kms_key_id = try(anomaly_detector.kms_key_id, null) != null ? anomaly_detector.kms_key_id : try(anomaly_detector.replica_key_custom_name, null) != null ? try(module.kms.kms_replica_external_key_arns[anomaly_detector.kms_key_custom_name][anomaly_detector.replica_key_custom_name], module.kms.kms_replica_key_arns[anomaly_detector.kms_key_custom_name][anomaly_detector.replica_key_custom_name]) : try(anomaly_detector.kms_key_custom_name, null) != null ? module.kms.kms_key_arns[anomaly_detector.kms_key_custom_name] : null }
          )
        }

        log_group = try(cloudwatch_logs.log_group, null) != null ? merge(cloudwatch_logs.log_group,
          { kms_key_id = try(cloudwatch_logs.log_group.kms_key_id, null) != null ? cloudwatch_logs.log_group.kms_key_id : try(cloudwatch_logs.log_group.replica_key_custom_name, null) != null ? try(module.kms.kms_replica_external_key_arns[cloudwatch_logs.log_group.kms_key_custom_name][cloudwatch_logs.log_group.replica_key_custom_name], module.kms.kms_replica_key_arns[cloudwatch_logs.log_group.kms_key_custom_name][cloudwatch_logs.log_group.replica_key_custom_name]) : try(cloudwatch_logs.log_group.kms_key_custom_name, null) != null ? module.kms.kms_key_arns[cloudwatch_logs.log_group.kms_key_custom_name] : null }
        ) : null
      }
    )
  }

  depends_on = [module.kms, module.iam]
}

module "kms" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-kms-component.git?ref=main"

  kms_map = { for key, kms in var.kms_map :
    key => merge(kms,
      {
        key = try(kms.key, null) != null ? merge(kms.key,
          { policy = try(kms.key.policy, null) != null ? kms.key.policy : try(kms.key.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[kms.key.iam_custom_name][kms.key.policy_custom_name] : null }
        ) : null

        external_key = try(kms.external_key, null) != null ? merge(kms.external_key,
          { policy = try(kms.external_key.policy, null) != null ? kms.external_key.policy : try(kms.external_key.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[kms.external_key.iam_custom_name][kms.external_key.policy_custom_name] : null }
        ) : null

        grants = { for grant_key, grant in kms.grants :
          grant_key => merge(grant,
            {
              grantee_principal  = try(grant.grantee_principal, null) != null ? grant.grantee_principal : try(grant.grantee_role_custom_name, null) != null ? module.iam.iam_role_arns[grant.grantee_role_custom_name] : try(grant.grantee_user_custom_name, null) != null ? module.iam.iam_user_arns[grant.grantee_iam_custom_name][grant.grantee_user_custom_name] : try(grant.grantee_service_linked_role_custom_name, null) != null ? module.iam.iam_service_linked_role_arns[grant.grantee_iam_custom_name][grant.grantee_service_linked_role_custom_name] : null
              retiring_principal = try(grant.retiring_principal, null) != null ? grant.retiring_principal : try(grant.retiring_role_custom_name, null) != null ? module.iam.iam_role_arns[grant.retiring_role_custom_name] : try(grant.retiring_user_custom_name, null) != null ? module.iam.iam_user_arns[grant.retiring_iam_custom_name][grant.retiring_user_custom_name] : try(grant.retiring_service_linked_role_custom_name, null) != null ? module.iam.iam_service_linked_role_arns[grant.retiring_iam_custom_name][grant.retiring_service_linked_role_custom_name] : null
            }
          )
        }

        replica_keys = { for replica_key, replica in kms.replica_keys :
          replica_key => merge(replica,
            { policy = try(replica.policy, null) != null ? replica.policy : try(replica.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[replica.iam_custom_name][replica.policy_custom_name] : null }
          )
        }

        replica_external_keys = { for replica_key, replica in kms.replica_external_keys :
          replica_key => merge(replica,
            { policy = try(replica.policy, null) != null ? replica.policy : try(replica.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[replica.iam_custom_name][replica.policy_custom_name] : null }
          )
        }

        key_policy = try(kms.key_policy, null) != null ? merge(kms.key_policy,
          { policy = try(kms.key_policy.policy, null) != null ? kms.key_policy.policy : try(kms.key_policy.policy_custom_name, null) != null ? module.iam.iam_policy_document_jsons[kms.key_policy.iam_custom_name][kms.key_policy.policy_custom_name] : null }
        ) : null
      }
    )
  }
}

module "iam" {
  source = "git::https://github.com/thecloudsolutions/terraform-aws-iam-component.git?ref=main"

  iam_map = var.iam_map
}
