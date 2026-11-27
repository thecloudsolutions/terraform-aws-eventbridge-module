variable "eventbridge_map" {
  type = map(object({
    bus = optional(object({
      region = optional(string)
      name   = string
      dead_letter_config = optional(object({
        arn = optional(string)
      }))
      description             = optional(string)
      event_source_name       = optional(string)
      kms_key_identifier      = optional(string)
      kms_key_custom_name     = optional(string)
      replica_key_custom_name = optional(string)
      log_config = optional(object({
        include_detail = optional(string)
        level          = optional(string)
      }))
      tags = optional(map(string))
    }))

    # Each event bus must have only one complete policy owner.
    bus_policies = optional(map(object({
      region             = optional(string)
      policy             = optional(string)
      iam_custom_name    = optional(string)
      policy_custom_name = optional(string)
      event_bus_name     = optional(string)
    })), {})

    rules = optional(map(object({
      region              = optional(string)
      name                = optional(string)
      name_prefix         = optional(string)
      schedule_expression = optional(string)
      event_bus_name      = optional(string)
      event_pattern       = optional(string)
      force_destroy       = optional(bool)
      description         = optional(string)
      role_arn            = optional(string)
      role_custom_name    = optional(string)
      is_enabled          = optional(bool)
      state               = optional(string)
      tags                = optional(map(string))
    })), {})

    targets = optional(map(object({
      region                      = optional(string)
      arn                         = optional(string)
      api_destination_custom_name = optional(string)
      # (Optional) Key in api_destinations. Used when arn is omitted.
      rule             = optional(string)
      rule_custom_name = optional(string)
      event_bus_name   = optional(string)
      force_destroy    = optional(bool)
      input            = optional(string)
      input_path       = optional(string)
      role_arn         = optional(string)
      role_custom_name = optional(string)
      target_id        = optional(string)

      appsync_target = optional(object({
        graphql_operation = optional(string)
      }))

      batch_target = optional(object({
        job_definition = string
        job_name       = string
        array_size     = optional(number)
        job_attempts   = optional(number)
      }))

      dead_letter_config = optional(object({
        arn = optional(string)
      }))

      ecs_target = optional(object({
        task_definition_arn     = string
        enable_ecs_managed_tags = optional(bool)
        enable_execute_command  = optional(bool)
        group                   = optional(string)
        launch_type             = optional(string)
        platform_version        = optional(string)
        propagate_tags          = optional(string)
        task_count              = optional(number)
        tags                    = optional(map(string))

        capacity_provider_strategy = optional(set(object({
          capacity_provider = string
          weight            = optional(number)
          base              = optional(number)
        })), [])

        network_configuration = optional(object({
          subnets          = set(string)
          security_groups  = optional(set(string))
          assign_public_ip = optional(bool)
        }))

        ordered_placement_strategy = optional(list(object({
          type  = string
          field = optional(string)
        })), [])

        placement_constraint = optional(set(object({
          type       = string
          expression = optional(string)
        })), [])
      }))

      http_target = optional(object({
        header_parameters       = optional(map(string))
        path_parameter_values   = optional(list(string))
        query_string_parameters = optional(map(string))
      }))

      input_transformer = optional(object({
        input_template = string
        input_paths    = optional(map(string))
      }))

      kinesis_target = optional(object({
        partition_key_path = optional(string)
      }))

      run_command_targets = optional(list(object({
        key    = string
        values = list(string)
      })), [])

      redshift_target = optional(object({
        database            = string
        db_user             = optional(string)
        secrets_manager_arn = optional(string)
        sql                 = optional(string)
        statement_name      = optional(string)
        with_event          = optional(bool)
      }))

      retry_policy = optional(object({
        maximum_event_age_in_seconds = optional(number)
        maximum_retry_attempts       = optional(number)
      }))

      sqs_target = optional(object({
        message_group_id = optional(string)
      }))

      sagemaker_pipeline_target = optional(object({
        pipeline_parameter_list = optional(set(object({
          name  = string
          value = string
        })), [])
      }))
    })), {})

    archives = optional(map(object({
      region           = optional(string)
      name             = string
      event_source_arn = optional(string)
      # (Optional) Source event bus ARN. Defaults to the event bus created by this unit.
      description             = optional(string)
      event_pattern           = optional(string)
      retention_days          = optional(number)
      kms_key_identifier      = optional(string)
      kms_key_custom_name     = optional(string)
      replica_key_custom_name = optional(string)
    })), {})

    connections = optional(map(object({
      region                  = optional(string)
      name                    = string
      authorization_type      = string
      description             = optional(string)
      kms_key_identifier      = optional(string)
      kms_key_custom_name     = optional(string)
      replica_key_custom_name = optional(string)

      auth_parameters = object({
        api_key = optional(object({
          key   = string
          value = string
        }))
        basic = optional(object({
          username = string
          password = string
        }))
        connectivity_parameters = optional(object({
          resource_parameters = object({
            resource_configuration_arn = string
          })
        }))
        invocation_http_parameters = optional(object({
          body = optional(list(object({
            key             = optional(string)
            value           = optional(string)
            is_value_secret = optional(bool)
          })), [])
          header = optional(list(object({
            key             = optional(string)
            value           = optional(string)
            is_value_secret = optional(bool)
          })), [])
          query_string = optional(list(object({
            key             = optional(string)
            value           = optional(string)
            is_value_secret = optional(bool)
          })), [])
        }))
        oauth = optional(object({
          authorization_endpoint = string
          http_method            = string
          client_parameters = optional(object({
            client_id     = string
            client_secret = string
          }))
          oauth_http_parameters = object({
            body = optional(list(object({
              key             = optional(string)
              value           = optional(string)
              is_value_secret = optional(bool)
            })), [])
            header = optional(list(object({
              key             = optional(string)
              value           = optional(string)
              is_value_secret = optional(bool)
            })), [])
            query_string = optional(list(object({
              key             = optional(string)
              value           = optional(string)
              is_value_secret = optional(bool)
            })), [])
          })
        }))
      })

      invocation_connectivity_parameters = optional(object({
        resource_parameters = object({
          resource_configuration_arn = string
        })
      }))
    })), {})

    api_destinations = optional(map(object({
      region                 = optional(string)
      name                   = string
      invocation_endpoint    = string
      http_method            = string
      connection_arn         = optional(string)
      connection_custom_name = optional(string)
      # (Optional) Key in connections. Used when connection_arn is omitted.
      description                      = optional(string)
      invocation_rate_limit_per_second = optional(number)
    })), {})

    endpoints = optional(map(object({
      region           = optional(string)
      name             = string
      description      = optional(string)
      role_arn         = optional(string)
      role_custom_name = optional(string)
      event_bus = list(object({
        event_bus_arn = string
      }))
      replication_config = optional(object({
        state = optional(string)
      }))
      routing_config = object({
        failover_config = object({
          primary = object({
            health_check = optional(string)
          })
          secondary = object({
            route = optional(string)
          })
        })
      })
    })), {})
  }))

  description = "Keyed collection of eventbridge definitions"
}

variable "cloudwatch_logs_map" {
  type = map(object({
    log_group = optional(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      skip_destroy                = optional(bool)
      log_group_class             = optional(string)
      retention_in_days           = optional(number)
      kms_key_id                  = optional(string)
      kms_key_custom_name         = optional(string)
      replica_key_custom_name     = optional(string)
      deletion_protection_enabled = optional(bool)
      region                      = optional(string)
      tags                        = optional(map(string))
    }))

    log_stream = optional(object({
      name           = string
      log_group_name = optional(string)
      region         = optional(string)
    }))

    account_policy = optional(object({
      policy_document             = optional(string)
      policy_document_custom_name = optional(string)
      policy_type                 = string
      policy_name                 = string
      scope                       = optional(string)
      selection_criteria          = optional(string)
      region                      = optional(string)
    }))

    destination_policies = optional(list(object({
      access_policy           = string
      destination_name        = optional(string)
      force_update            = optional(bool)
      destination_custom_name = optional(string)
      region                  = optional(string)
    })), [])

    data_protection_policy = optional(object({
      policy_document             = optional(string)
      policy_document_custom_name = optional(string)
      log_group_name              = optional(string)
      region                      = optional(string)
    }))

    destinations = optional(map(object({
      name             = string
      role_arn         = optional(string)
      role_custom_name = optional(string)
      target_arn       = string
      tags             = optional(map(string))
      region           = optional(string)
    })), {})

    metric_filters = optional(list(object({
      name                      = string
      pattern                   = string
      log_group_name            = optional(string)
      apply_on_transformed_logs = optional(bool)
      region                    = optional(string)

      metric_transformation = object({
        name          = string
        namespace     = string
        value         = string
        default_value = optional(number)
        dimensions    = optional(map(string))
        unit          = optional(string)
      })
    })), [])

    resource_policy = optional(object({
      policy_document = string
      policy_name     = optional(string)
      resource_arn    = optional(string)
      region          = optional(string)
    }))

    subscription_filters = optional(list(object({
      name                      = string
      destination_arn           = optional(string)
      destination_custom_name   = optional(string)
      filter_pattern            = string
      log_group_name            = optional(string)
      role_arn                  = optional(string)
      role_custom_name          = optional(string)
      distribution              = optional(string)
      apply_on_transformed_logs = optional(bool)
      emit_system_fields        = optional(set(string))
      region                    = optional(string)
    })), [])

    query_definitions = optional(list(object({
      name            = string
      query_string    = string
      log_group_names = optional(list(string))
      region          = optional(string)
    })), [])

    anomaly_detectors = optional(map(object({
      enabled                 = bool
      log_group_arn_list      = optional(list(string))
      anomaly_visibility_time = optional(number)
      detector_name           = optional(string)
      evaluation_frequency    = optional(string)
      filter_pattern          = optional(string)
      kms_key_id              = optional(string)
      kms_key_custom_name     = optional(string)
      replica_key_custom_name = optional(string)
      region                  = optional(string)
      tags                    = optional(map(string))
    })), {})

    data_protection_policy_documents = optional(map(object({
      name           = string
      description    = optional(string)
      policy_version = optional(string)

      configuration = optional(object({
        custom_data_identifier = optional(list(object({
          name  = string
          regex = string
        })), [])
      }))

      statement = list(object({
        data_identifiers = set(string)
        sid              = optional(string)
        operation = object({
          audit = optional(object({
            findings_destination = object({
              cloudwatch_logs = optional(object({
                log_group = string
              }))
              firehose = optional(object({
                delivery_stream = string
              }))
              s3 = optional(object({
                bucket = string
              }))
            })
          }))
          deidentify = optional(object({
            mask_config = object({})
          }))
        })
      }))
    })), {})

    index_policy = optional(object({
      log_group_name  = optional(string)
      policy_document = string
      region          = optional(string)
    }))

    transformer = optional(object({
      log_group_arn = optional(string)
      region        = optional(string)

      transformer_config = list(object({
        add_keys = optional(object({
          entry = list(object({
            key                 = string
            value               = string
            overwrite_if_exists = optional(bool)
          }))
        }))
        copy_value = optional(object({
          entry = list(object({
            source              = string
            target              = string
            overwrite_if_exists = optional(bool)
          }))
        }))
        csv = optional(list(object({
          columns         = optional(list(string))
          delimiter       = optional(string)
          quote_character = optional(string)
          source          = optional(string)
        })), [])
        date_time_converter = optional(list(object({
          locale          = optional(string)
          match_patterns  = list(string)
          source          = string
          source_timezone = optional(string)
          target          = string
          target_format   = optional(string)
          target_timezone = optional(string)
        })), [])
        delete_keys = optional(list(object({
          with_keys = list(string)
        })), [])
        grok = optional(object({
          match  = string
          source = optional(string)
        }))
        list_to_map = optional(list(object({
          flatten           = optional(bool)
          flattened_element = optional(string)
          key               = string
          source            = string
          target            = optional(string)
          value_key         = optional(string)
        })), [])
        lower_case_string = optional(list(object({
          with_keys = list(string)
        })), [])
        move_keys = optional(list(object({
          entry = list(object({
            source              = string
            target              = string
            overwrite_if_exists = optional(bool)
          }))
        })), [])
        parse_cloudfront = optional(object({
          source = optional(string)
        }))
        parse_json = optional(list(object({
          destination = optional(string)
          source      = optional(string)
        })), [])
        parse_key_value = optional(list(object({
          destination         = optional(string)
          field_delimiter     = optional(string)
          key_prefix          = optional(string)
          key_value_delimiter = optional(string)
          non_match_value     = optional(string)
          overwrite_if_exists = optional(bool)
          source              = optional(string)
        })), [])
        parse_postgres = optional(object({
          source = optional(string)
        }))
        parse_route53 = optional(object({
          source = optional(string)
        }))
        parse_to_ocsf = optional(object({
          event_source = string
          ocsf_version = string
          source       = optional(string)
        }))
        parse_vpc = optional(object({
          source = optional(string)
        }))
        parse_waf = optional(object({
          source = optional(string)
        }))
        rename_keys = optional(list(object({
          entry = list(object({
            key                 = string
            rename_to           = string
            overwrite_if_exists = optional(bool)
          }))
        })), [])
        split_string = optional(list(object({
          entry = list(object({
            delimiter = string
            source    = string
          }))
        })), [])
        substitute_string = optional(list(object({
          entry = list(object({
            from   = string
            source = string
            to     = string
          }))
        })), [])
        trim_string = optional(list(object({
          with_keys = list(string)
        })), [])
        type_converter = optional(list(object({
          entry = list(object({
            key  = string
            type = string
          }))
        })), [])
        upper_case_string = optional(list(object({
          with_keys = list(string)
        })), [])
      }))
    }))

    delivery_sources = optional(map(object({
      region                  = optional(string)
      name                    = string
      log_type                = string
      resource_arn            = optional(string)
      eventbridge_custom_name = optional(string)
      # (Optional) Key in eventbridge_map. Used when resource_arn is omitted.
      tags = optional(map(string))
    })), {})

    delivery_destinations = optional(map(object({
      region                    = optional(string)
      name                      = string
      delivery_destination_type = optional(string)
      output_format             = optional(string)
      delivery_destination_configuration = optional(object({
        destination_resource_arn = optional(string)
        # (Optional) Defaults to the log group in this entry when this configuration is provided.
      }))
      tags = optional(map(string))
    })), {})

    deliveries = optional(map(object({
      region                      = optional(string)
      delivery_source_name        = optional(string)
      delivery_source_custom_name = optional(string)
      # (Optional) Key in delivery_sources. Used when delivery_source_name is omitted.
      delivery_destination_arn         = optional(string)
      delivery_destination_custom_name = optional(string)
      # (Optional) Key in delivery_destinations. Used when delivery_destination_arn is omitted.
      field_delimiter = optional(string)
      record_fields   = optional(list(string))
      s3_delivery_configuration = optional(list(object({
        enable_hive_compatible_path = optional(bool)
        suffix_path                 = optional(string)
      })))
      tags = optional(map(string))
    })), {})
  }))

  description = "Keyed collection of cloudwatch logs definitions"
  default     = {}
}

variable "kms_map" {
  type = map(object({
    key = optional(object({
      region                             = optional(string)
      description                        = optional(string)
      key_usage                          = optional(string)
      custom_key_store_id                = optional(string)
      custom_key_store_custom_name       = optional(string)
      customer_master_key_spec           = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      is_enabled                         = optional(bool)
      enable_key_rotation                = optional(bool)
      rotation_period_in_days            = optional(number)
      multi_region                       = optional(bool)
      xks_key_id                         = optional(string)
      tags                               = optional(map(string))
      timeouts = optional(object({
        create = optional(string)
      }))
    }))

    external_key = optional(object({
      region                             = optional(string)
      description                        = optional(string)
      key_spec                           = optional(string)
      key_usage                          = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      key_material_base64                = optional(string)
      multi_region                       = optional(bool)
      valid_to                           = optional(string)
      tags                               = optional(map(string))
    }))

    existing_key = optional(object({
      region       = optional(string)
      key_id       = string
      grant_tokens = optional(list(string))
    }))

    aliases = optional(map(object({
      region                  = optional(string)
      name                    = optional(string)
      name_prefix             = optional(string)
      target_key_id           = optional(string)
      replica_key_custom_name = optional(string)
    })), {})

    grants = optional(map(object({
      region                                   = optional(string)
      key_id                                   = optional(string)
      replica_key_custom_name                  = optional(string)
      name                                     = optional(string)
      grantee_principal                        = optional(string)
      grantee_iam_custom_name                  = optional(string)
      grantee_role_custom_name                 = optional(string)
      grantee_user_custom_name                 = optional(string)
      grantee_service_linked_role_custom_name  = optional(string)
      operations                               = set(string)
      retiring_principal                       = optional(string)
      retiring_iam_custom_name                 = optional(string)
      retiring_role_custom_name                = optional(string)
      retiring_user_custom_name                = optional(string)
      retiring_service_linked_role_custom_name = optional(string)
      retire_on_delete                         = optional(bool)
      grant_creation_tokens                    = optional(set(string))
      constraints = optional(set(object({
        encryption_context_equals = optional(map(string))
        encryption_context_subset = optional(map(string))
      })))
    })), {})

    replica_keys = optional(map(object({
      region                             = optional(string)
      primary_key_arn                    = optional(string)
      description                        = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      tags                               = optional(map(string))
    })), {})

    replica_external_keys = optional(map(object({
      region                             = optional(string)
      primary_key_arn                    = optional(string)
      description                        = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
      deletion_window_in_days            = optional(number)
      enabled                            = optional(bool)
      key_material_base64                = optional(string)
      valid_to                           = optional(string)
      tags                               = optional(map(string))
    })), {})

    key_policy = optional(object({
      region                             = optional(string)
      key_id                             = optional(string)
      policy                             = optional(string)
      iam_custom_name                    = optional(string)
      policy_custom_name                 = optional(string)
      bypass_policy_lockout_safety_check = optional(bool)
    }))

    custom_key_stores = optional(map(object({
      region                   = optional(string)
      custom_key_store_name    = string
      custom_key_store_type    = optional(string)
      cloud_hsm_cluster_id     = optional(string)
      key_store_password       = optional(string)
      trust_anchor_certificate = optional(string)
      xks_proxy_authentication_credential = optional(object({
        access_key_id         = string
        raw_secret_access_key = string
      }))
      xks_proxy_connectivity              = optional(string)
      xks_proxy_uri_endpoint              = optional(string)
      xks_proxy_uri_path                  = optional(string)
      xks_proxy_vpc_endpoint_service_name = optional(string)
      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))
    })), {})

    public_key = optional(object({
      region                  = optional(string)
      key_id                  = optional(string)
      replica_key_custom_name = optional(string)
      grant_tokens            = optional(list(string))
    }))
  }))

  description = "Keyed collection of kms definitions"
  default     = {}
}

variable "iam_map" {
  type = map(object({
    account_alias = optional(object({
      account_alias = string
    }))

    account_password_policy = optional(object({
      allow_users_to_change_password = optional(bool)
      hard_expiry                    = optional(bool)
      max_password_age               = optional(number)
      minimum_password_length        = optional(number)
      password_reuse_prevention      = optional(number)
      require_lowercase_characters   = optional(bool)
      require_numbers                = optional(bool)
      require_symbols                = optional(bool)
      require_uppercase_characters   = optional(bool)
    }))

    role = optional(object({
      assume_role_policy                      = optional(string)
      assume_role_policy_document_custom_name = optional(string)
      description                             = optional(string)
      force_detach_policies                   = optional(bool)
      inline_policy = optional(set(object({
        name   = string
        policy = string
      })), [])

      managed_policy_arns              = optional(set(string))
      max_session_duration             = optional(number)
      name                             = optional(string)
      name_prefix                      = optional(string)
      path                             = optional(string)
      permissions_boundary             = optional(string)
      permissions_boundary_custom_name = optional(string)

      tags = optional(map(string))
    }))

    policy_documents = optional(map(object({
      override_policy_documents = optional(list(string))
      policy_id                 = optional(string)
      source_policy_documents   = optional(list(string))
      policy_version            = optional(string)

      statement = optional(list(object({
        actions       = optional(set(string))
        effect        = optional(string)
        not_actions   = optional(set(string))
        not_resources = optional(set(string))
        resources     = optional(set(string))
        sid           = optional(string)

        condition = optional(set(object({
          test     = string
          variable = string
          values   = list(any)
        })), [])

        principals = optional(set(object({
          identifiers                = set(string)
          saml_provider_custom_names = optional(set(string), [])
          type                       = string
        })), [])

        not_principals = optional(set(object({
          identifiers                = set(string)
          saml_provider_custom_names = optional(set(string), [])
          type                       = string
        })), [])
      })), [])
    })), {})

    role_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      role                        = optional(string)
    })), {})

    role_policy_attachments = optional(list(object({
      custom_name        = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
      role               = optional(string)
    })), [])

    role_policies_exclusive = optional(object({
      role_name           = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    }))

    instance_profile = optional(object({
      name        = optional(string)
      name_prefix = optional(string)
      path        = optional(string)
      role        = optional(string)
      tags        = optional(map(string))
    }))

    policy_attachments_exclusive = optional(object({
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
      role_name           = optional(string)
    }))

    policies = optional(map(object({
      policy                            = optional(string)
      policy_custom_name                = optional(string)
      delay_after_policy_creation_in_ms = optional(number)
      description                       = optional(string)
      name                              = optional(string)
      name_prefix                       = optional(string)
      path                              = optional(string)
      tags                              = optional(map(string))
    })), {})

    users = optional(map(object({
      name                             = string
      path                             = optional(string)
      permissions_boundary             = optional(string)
      permissions_boundary_custom_name = optional(string)
      force_destroy                    = optional(bool)
      tags                             = optional(map(string))
    })), {})

    user_login_profiles = optional(map(object({
      user                    = optional(string)
      user_custom_name        = optional(string)
      pgp_key                 = optional(string)
      password_length         = optional(number)
      password_reset_required = optional(bool)
    })), {})

    access_keys = optional(map(object({
      user             = optional(string)
      user_custom_name = optional(string)
      pgp_key          = optional(string)
      status           = optional(string)
    })), {})

    user_ssh_keys = optional(map(object({
      username         = optional(string)
      user_custom_name = optional(string)
      encoding         = string
      public_key       = string
      status           = optional(string)
    })), {})

    groups = optional(map(object({
      name = string
      path = optional(string)
    })), {})

    user_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      user                        = optional(string)
      user_custom_name            = optional(string)
    })), {})

    user_policy_attachments = optional(map(object({
      user               = optional(string)
      user_custom_name   = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
    })), {})

    user_policies_exclusive = optional(map(object({
      user_name           = optional(string)
      user_custom_name    = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    user_policy_attachments_exclusive = optional(map(object({
      user_name           = optional(string)
      user_custom_name    = optional(string)
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_policies = optional(map(object({
      name                        = optional(string)
      name_prefix                 = optional(string)
      policy                      = optional(string)
      policy_document_custom_name = optional(string)
      group                       = optional(string)
      group_custom_name           = optional(string)
    })), {})

    group_policy_attachments = optional(map(object({
      group              = optional(string)
      group_custom_name  = optional(string)
      policy_arn         = optional(string)
      policy_custom_name = optional(string)
    })), {})

    group_policies_exclusive = optional(map(object({
      group_name          = optional(string)
      group_custom_name   = optional(string)
      policy_names        = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_policy_attachments_exclusive = optional(map(object({
      group_name          = optional(string)
      group_custom_name   = optional(string)
      policy_arns         = set(string)
      policy_custom_names = optional(set(string), [])
    })), {})

    group_memberships = optional(map(object({
      name              = string
      users             = set(string)
      user_custom_names = optional(set(string), [])
      group             = optional(string)
      group_custom_name = optional(string)
    })), {})

    user_group_memberships = optional(map(object({
      user   = optional(string)
      groups = optional(set(string), [])
    })), {})

    openid_connect_providers = optional(map(object({
      url             = string
      client_id_list  = set(string)
      thumbprint_list = optional(list(string))
      tags            = optional(map(string))
    })), {})

    saml_providers = optional(map(object({
      name                   = string
      saml_metadata_document = string
      tags                   = optional(map(string))
    })), {})

    service_linked_roles = optional(map(object({
      aws_service_name = string
      custom_suffix    = optional(string)
      description      = optional(string)
      tags             = optional(map(string))
    })), {})
  }))

  description = "Keyed collection of iam definitions"
  default     = {}
}
