{

  name => 'CatalystX::Example::Checklist::Web',
  default_view => 'HTML',
  disable_component_resolution_regex_fallback => 1,

  'Plugin::URLMap' => {
    '/favicon.ico' => {
      File => { file => '__path_to(share,static,favicon.ico)__' }},
    '/static' => {
      File => { root => '__path_to(share,static)__' }},
  },
  'Plugin::EnableMiddleware' => [
    'Debug',
    'Debug::DBIC::QueryLog', {querylog_args => {passthrough=>1}},
  ],
  'Plugin::Authentication' => {
    default_realm => 'internal_account',
    realms => {
      internal_account => {
        credential => {
          class => 'Password',
          password_type => 'self_check',
          password_field => 'password'
        },
        store => {
          class => 'DBIx::Class',
          user_model => 'Schema::User',
        },
      },
    },
  },
  'Controller::Root' => {
    namespace => '',
  },
  'Model::Schema' => {
    traits => ['FromMigration','QueryLog::AdoptPlack'],
    schema_class => 'CatalystX::Example::Checklist::Schema',
  },
  'View::HTML' => {
    INCLUDE_PATH => [ '__path_to(share,html)__',
      '__path_to(share,html,lib)__' ],
    TEMPLATE_EXTENSION => '.tt',
    PROCESS => 'page',
    EXPOSE_BLOCKS => 1,
  },

};

