# Manage your foreman server
#
# === Parameters:
#
# $foreman_url::                URL on which foreman is going to run
#
# $puppetrun::                  Should foreman be able to start puppetruns on nodes
#                               type: boolean
#
# $unattended::                 Should foreman manage host provisioning as well
#                               type:boolean
#
# $authentication::             Enable user authentication. Initial credentials are set using admin_username
#                               and admin_password.
#                               type:boolean
#
# $passenger::                  Configure foreman via apache and passenger
#                               type:boolean
#
# $passenger_ruby::             Ruby interpreter used to run Foreman under Passenger
#
# $passenger_ruby_package::     Package to install to provide Passenger libraries for the active Ruby
#                               interpreter
#
# $plugin_prefix::              String which is prepended to the plugin package names
#
# $use_vhost::                  Enclose apache configuration in VirtualHost tags
#                               type:boolean
#
# $servername::                 Server name of the VirtualHost in the webserver
#
# $serveraliases::              Server aliases of the VirtualHost in the webserver
#                               type:array
#
# $ssl::                        Enable and set require_ssl in Foreman settings (note: requires passenger, SSL does not apply to kickstarts)
#                               type:boolean
#
# $custom_repo::                No need to change anything here by default
#                               if set to true, no repo will be added by this module, letting you to
#                               set it to some custom location.
#                               type:boolean
#
# $repo::                       This can be stable, nightly or a specific version i.e. 1.7
#
# $configure_epel_repo::        If disabled the EPEL repo will not be configured on Red Hat family systems.
#                               type:boolean
#
# $configure_scl_repo::         If disabled the SCL repo will not be configured on Red Hat clone systems.
#                               (Currently only installs repos for CentOS and Scientific)
#                               type:boolean
#
# $configure_brightbox_repo::   Configure the Brightbox PPA for Ubuntu, providing updated Ruby and
#                               Passenger packages
#                               type:boolean
#
# $selinux::                    when undef, foreman-selinux will be installed if SELinux is enabled
#                               setting to false/true will override this check (e.g. set to false on 1.1)
#                               type:boolean
#
# $gpgcheck::                   turn on/off gpg check in repo files (effective only on RedHat family systems)
#                               type:boolean
#
# $version::                    foreman package version, it's passed to ensure parameter of package resource
#                               can be set to specific version number, 'latest', 'present' etc.
#
# $plugin_version::             foreman plugins package version, it's passed to ensure parameter of package resource
#                               can be set to 'installed', 'latest', 'present' only
#
# $db_manage::                  if enabled, will install and configure the database server on this host
#                               type:boolean
#
# $db_type::                    Database 'production' type (valid types: mysql/postgresql/sqlite)
#
# $db_adapter::                 Database 'production' adapter
#
# $db_host::                    Database 'production' host
#
# $db_port::                    Database 'production' port
#                               type:integer
#
# $db_database::                Database 'production' database (e.g. foreman)
#
# $db_username::                Database 'production' user (e.g. foreman)
#
# $db_password::                Database 'production' password (default is random)
#
# $db_sslmode::                 Database 'production' ssl mode
#
# $db_pool::                    Database 'production' size of connection pool
#                               type:integer
#
# $apipie_task::                Rake task to generate API documentation.
#                               Use 'apipie:cache' on 1.7 or older, 'apipie:cache:index' on 1.8 or newer.
#
# $app_root::                   Name of foreman root directory
#
# $manage_user::                Controls whether foreman module will manage the user on the system. (default true)
#                               type:boolean
#
# $user::                       User under which foreman will run
#
# $group::                      Primary group for the Foreman user
#
# $user_groups::                Additional groups for the Foreman user
#                               type:array
#
# $environment::                Rails environment of foreman
#
# $puppet_home::                Puppet home directory
#
# $puppet_ssldir::              Puppet SSL directory
#
# $locations_enabled::          Enable locations?
#                               type:boolean
#
# $organizations_enabled::      Enable organizations?
#                               type:boolean
#
# $passenger_interface::        Defines which network interface passenger should listen on, undef means all interfaces
#
# $passenger_prestart::         Pre-start the first passenger worker instance process during httpd start.
#                               type:boolean
#
# $passenger_min_instances::    Minimum passenger worker instances to keep when application is idle.
#
# $passenger_start_timeout::    Amount of seconds to wait for Ruby application boot.
#
# $vhost_priority::             Defines Apache vhost priority for the Foreman vhost conf file.
#
# $server_ssl_ca::              Defines Apache mod_ssl SSLCACertificateFile setting in Foreman vhost conf file.
#
# $server_ssl_chain::           Defines Apache mod_ssl SSLCertificateChainFile setting in Foreman vhost conf file.
#
# $server_ssl_cert::            Defines Apache mod_ssl SSLCertificateFile setting in Foreman vhost conf file.
#
# $server_ssl_certs_dir::       Defines Apache mod_ssl SSLCACertificatePath setting in Foreman vhost conf file.
#
# $server_ssl_key::             Defines Apache mod_ssl SSLCertificateKeyFile setting in Foreman vhost conf file.
#
# $server_ssl_crl::             Defines the Apache mod_ssl SSLCARevocationFile setting in Foreman vhost conf file.
# 
# $client_ssl_ca::              Defines the SSL CA used to communicate with Foreman Proxies
#
# $client_ssl_cert::            Defines the SSL certificate used to communicate with Foreman Proxies
#
# $client_ssl_key::             Defines the SSL private key used to communicate with Foreman Proxies
#
# $keepalive::                  Enable KeepAlive setting of Apache?
#                               type:boolean
#
# $max_keepalive_requests::     MaxKeepAliveRequests setting of Apache
#                               (Number of requests allowed on a persistent connection)
#                               type:integer
#
# $keepalive_timeout::          KeepAliveTimeout setting of Apache
#                               (Seconds the server will wait for subsequent requests on a persistent connection)
#                               type:integer
#
# $oauth_active::               Enable OAuth authentication for REST API
#                               type:boolean
#
# $oauth_map_users::            Should foreman use the foreman_user header to identify API user?
#                               type:boolean
#
# $oauth_consumer_key::         OAuth consumer key
#
# $oauth_consumer_secret::      OAuth consumer secret
#
# $admin_username::             Username for the initial admin user
#
# $admin_password::             Password of the initial admin user, default is randomly generated
#
# $admin_first_name::           First name of the initial admin user
#
# $admin_last_name::            Last name of the initial admin user
#
# $admin_email::                E-mail address of the initial admin user
#
# $initial_organization::       Name of an initial organization
#
# $initial_location::           Name of an initial location
#
# $ipa_authentication::         Enable configuration for external authentication via IPA
#                               type:boolean
#
# $http_keytab::                Path to keytab to be used for Kerberos authentication on the WebUI
#
# $pam_service::                PAM service used for host-based access control in IPA
#
# $ipa_manage_sssd::            If ipa_authentication is true, should the installer manage SSSD? You can disable it
#                               if you use another module for SSSD configuration
#                               type:boolean
#
# $websockets_encrypt::         Whether to encrypt websocket connections
#                               type:boolean
#
# $websockets_ssl_key::         SSL key file to use when encrypting websocket connections
#
# $websockets_ssl_cert::        SSL certificate file to use when encrypting websocket connections
#
# $logging_level::              Logging level of the Foreman application (valid values: debug, info, warn, error, fatal)
#
# $loggers::                    Enable or disable specific loggers, e.g. {"sql" => true}
#                               type:hash
#
# $email_conf::                 email configuration file, defaults to /etc/foreman/email.yaml
#
# $email_source::               template to use for email configuration file
#
# $email_delivery_method::      can be sendmail or smtp regarding to foreman documentation
#
# $email_smtp_address::         if delivery_method is smtp, this should contain an valid smtp host
#
# $email_smtp_port::            smtp port, defaults to 25
#                               type: integer
#
# $email_smtp_domain::          email domain
#
# $email_smtp_authentication::  authentication settings, can be none or login, defaults to none
#
# $email_smtp_user_name::       user_name for mail server auth, if authentication login
#
# $email_smtp_password::        password for mail server auth, if authentication login
#
class foreman (
  $foreman_url               = $::foreman::params::foreman_url,
  $puppetrun                 = $::foreman::params::puppetrun,
  $unattended                = $::foreman::params::unattended,
  $authentication            = $::foreman::params::authentication,
  $passenger                 = $::foreman::params::passenger,
  $passenger_ruby            = $::foreman::params::passenger_ruby,
  $passenger_ruby_package    = $::foreman::params::passenger_ruby_package,
  $plugin_prefix             = $::foreman::params::plugin_prefix,
  $use_vhost                 = $::foreman::params::use_vhost,
  $servername                = $::foreman::params::servername,
  $serveraliases             = $::foreman::params::serveraliases,
  $ssl                       = $::foreman::params::ssl,
  $custom_repo               = $::foreman::params::custom_repo,
  $repo                      = $::foreman::params::repo,
  $configure_epel_repo       = $::foreman::params::configure_epel_repo,
  $configure_scl_repo        = $::foreman::params::configure_scl_repo,
  $configure_brightbox_repo  = $::foreman::params::configure_brightbox_repo,
  $selinux                   = $::foreman::params::selinux,
  $gpgcheck                  = $::foreman::params::gpgcheck,
  $version                   = $::foreman::params::version,
  $plugin_version            = $::foreman::params::plugin_version,
  $db_manage                 = $::foreman::params::db_manage,
  $db_type                   = $::foreman::params::db_type,
  $db_adapter                = 'UNSET',
  $db_host                   = 'UNSET',
  $db_port                   = 'UNSET',
  $db_database               = 'UNSET',
  $db_username               = $::foreman::params::db_username,
  $db_password               = $::foreman::params::db_password,
  $db_sslmode                = 'UNSET',
  $db_pool                   = $::foreman::params::db_pool,
  $apipie_task               = $::foreman::params::apipie_task,
  $app_root                  = $::foreman::params::app_root,
  $manage_user               = $::foreman::params::manage_user,
  $user                      = $::foreman::params::user,
  $group                     = $::foreman::params::group,
  $user_groups               = $::foreman::params::user_groups,
  $environment               = $::foreman::params::environment,
  $puppet_home               = $::foreman::params::puppet_home,
  $puppet_ssldir             = $::foreman::params::puppet_ssldir,
  $locations_enabled         = $::foreman::params::locations_enabled,
  $organizations_enabled     = $::foreman::params::organizations_enabled,
  $passenger_interface       = $::foreman::params::passenger_interface,
  $vhost_priority            = $::foreman::params::vhost_priority,
  $server_ssl_ca             = $::foreman::params::server_ssl_ca,
  $server_ssl_chain          = $::foreman::params::server_ssl_chain,
  $server_ssl_cert           = $::foreman::params::server_ssl_cert,
  $server_ssl_certs_dir      = $::foreman::params::server_ssl_certs_dir,
  $server_ssl_key            = $::foreman::params::server_ssl_key,
  $server_ssl_crl            = $::foreman::params::server_ssl_crl,
  $client_ssl_ca             = $::foreman::params::server_ssl_ca,
  $client_ssl_cert           = $::foreman::params::server_ssl_cert,
  $client_ssl_key            = $::foreman::params::server_ssl_key,
  $keepalive                 = $::foreman::params::keepalive,
  $max_keepalive_requests    = $::foreman::params::max_keepalive_requests,
  $keepalive_timeout         = $::foreman::params::keepalive_timeout,
  $oauth_active              = $::foreman::params::oauth_active,
  $oauth_map_users           = $::foreman::params::oauth_map_users,
  $oauth_consumer_key        = $::foreman::params::oauth_consumer_key,
  $oauth_consumer_secret     = $::foreman::params::oauth_consumer_secret,
  $passenger_prestart        = $::foreman::params::passenger_prestart,
  $passenger_min_instances   = $::foreman::params::passenger_min_instances,
  $passenger_start_timeout   = $::foreman::params::passenger_start_timeout,
  $admin_username            = $::foreman::params::admin_username,
  $admin_password            = $::foreman::params::admin_password,
  $admin_first_name          = $::foreman::params::admin_first_name,
  $admin_last_name           = $::foreman::params::admin_last_name,
  $admin_email               = $::foreman::params::admin_email,
  $initial_organization      = $::foreman::params::initial_organization,
  $initial_location          = $::foreman::params::initial_location,
  $ipa_authentication        = $::foreman::params::ipa_authentication,
  $http_keytab               = $::foreman::params::http_keytab,
  $pam_service               = $::foreman::params::pam_service,
  $ipa_manage_sssd           = $::foreman::params::ipa_manage_sssd,
  $websockets_encrypt        = $::foreman::params::websockets_encrypt,
  $websockets_ssl_key        = $::foreman::params::websockets_ssl_key,
  $websockets_ssl_cert       = $::foreman::params::websockets_ssl_cert,
  $logging_level             = $::foreman::params::logging_level,
  $loggers                   = $::foreman::params::loggers,
  $email_conf                = $::foreman::params::email_conf,
  $email_source              = $::foreman::params::email_source,
  $email_delivery_method     = $::foreman::params::email_delivery_method,
  $email_smtp_address        = $::foreman::params::email_smtp_address,
  $email_smtp_port           = $::foreman::params::email_smtp_port,
  $email_smtp_domain         = $::foreman::params::email_smtp_domain,
  $email_smtp_authentication = $::foreman::params::email_smtp_authentication,
  $email_smtp_user_name      = $::foreman::params::email_smtp_user_name,
  $email_smtp_password       = $::foreman::params::email_smtp_password,
) inherits foreman::params {
  if $db_adapter == 'UNSET' {
    $db_adapter_real = $::foreman::db_type ? {
      'sqlite' => 'sqlite3',
      'mysql'  => 'mysql2',
      default  => $::foreman::db_type,
    }
  } else {
    $db_adapter_real = $db_adapter
  }
  validate_bool($passenger)
  if $passenger == false and $ipa_authentication {
    fail("${::hostname}: External authentication via IPA can only be enabled when passenger is used.")
  }
  validate_bool($websockets_encrypt)
  validate_re($logging_level, '^(debug|info|warn|error|fatal)$')
  validate_re($plugin_version, '^(installed|present|latest)$')
  validate_hash($loggers)
  validate_array($serveraliases)
  if $email_delivery_method {
    validate_re($email_delivery_method, ['^sendmail$', '^smtp$'], "email_delivery_method can be either sendmail or smtp, not ${email_delivery_method}")
  }
  validate_bool($puppetrun)

  include ::foreman::repo

  Class['foreman::repo'] ~>
  class { '::foreman::install': } ~>
  class { '::foreman::config': } ~>
  class { '::foreman::database': } ~>
  class { '::foreman::service': } ->
  Class['foreman'] ->
  Foreman_smartproxy <| base_url == $foreman_url |>

  # Anchor these separately so as not to break
  # the notify between main classes
  Class['foreman::install'] ~>
  Package <| tag == 'foreman-compute' |> ~>
  Class['foreman::service']

  Class['foreman::repo'] ~>
  Package <| tag == 'foreman::cli' |> ~>
  Class['foreman']

  Class['foreman::repo'] ~>
  Package <| tag == 'foreman::providers' |> ->
  Class['foreman']

  # lint:ignore:spaceship_operator_without_tag
  Class['foreman::database']~>
  Foreman::Plugin <| |> ~>
  Class['foreman::service']
  # lint:endignore

}
