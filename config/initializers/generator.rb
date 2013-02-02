Rails.application.config.generators do |g|
  g.test_framework :rspec, 
                   :fixture => false, 
                   :view_specs => false, 
                   :controller_specs => false,
                   :helper_specs => false,
                   :routing_specs => false
  g.integration_tool false
  g.stylesheets false
  g.helper false
  g.fixture_replacement :factory_girl
  g.template_engine :slim
  g.fallbacks[:slim] = :erb
end