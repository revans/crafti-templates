
require 'pathname'
path              = ::Pathname.new("/Users/robert/dotfiles/crafti-templates").expand_path
template_path     = path.join("api/templates")
shared_templates  = path.join("shared_templates")

app_name = "CmsApi"
app_name_underscored = "cms_api"

root "sinatra_api" do
  mkdir   "app/views"
  mkdir   "test"
  mkdir   "config"
  touch   "Readme.mkd"

  cp "Rakefile",              shared_templates.join("Rakefile")
  cp ".gitignore",            shared_templates.join("gitignore")
  cp "Procfile",              template_path.join("Procfile")
  cp "config/boot.rb",        template_path.join("config/boot.rb")

  template "config/application.rb",
    template_path.join('config/application.rb.erb'),
    { app_classname: app_name }

  template "config/configuration.rb",
    template_path.join('config/configuration.rb.erb'),
    { app_classname: app_name }

  template "app/api.rb",
    template_path.join('app/api.rb.erb'),
    { app_classname: app_name }

  template "config.ru",
    template_path.join('config.ru.erb'),
    { app_classname: app_name }

  template "Gemfile",
    template_path.join('Gemfile.erb'),
    { ruby_version: "2.1.0" }

  template ".env.sample",
    template_path.join('env.sample.erb'),
    { database_name:      app_name_underscored,
      database_username:  "robert" }

  template ".env",
    template_path.join('env.sample.erb'),
    { database_name:      app_name_underscored,
      database_username:  "robert" }

  bundle :install, with: 'binstubs'

  git do
    init
    add '.'
    commit 'Create the new project'
  end
end