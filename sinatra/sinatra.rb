
require 'pathname'
path              = ::Pathname.new("/Users/robert/dotfiles/crafti-templates").expand_path
template_path     = path.join("sinatra/templates")
shared_templates  = path.join("shared_templates")

root "sinatra" do
  mkdir "app"
  mkdir "test"
  mkdir "public"
  mkdir "config"
  mkdir "assets/app/fonts"
  mkdir "assets/app/images"
  mkdir "assets/app/javascripts"
  mkdir "assets/app/stylesheets"
  mkdir "assets/app/templates"
  mkdir "assets/vendor"

  touch "Readme.mkd"
  touch "assets/app/javascripts/application.js.coffee"
  touch "assets/app/stylesheets/application.css.scss"

  template "config/applicationb.rb",
    template_path.join('config/application.rb.erb'),
    { app_classname: 'GetTheRundown' }

  template "config.ru",
    template_path.join('config.ru.erb'),
    { app_classname: 'GetTheRundown' }

  template "Gemfile",
    template_path.join('Gemfile.erb'),
    { ruby_version: "2.1.0" }

  template ".env.sample",
    template_path.join('env.sample.erb'),
    { database_name:      "get_the_rundown",
      database_username:  "robert" }

  cp "index.html.erb",        shared_templates.join("index.html")
  cp "Rakefile",              template_path.join("Rakefile")
  cp "Guardfile",             template_path.join("Guardfile")
  cp "Procfile",              template_path.join("Procfile")
  cp ".bowerrc",              template_path.join("bowerrc")
  cp ".foreman",              template_path.join("foreman")
  cp ".gitignore",            template_path.join("gitignore")
  cp "test/test_helper.rb",   template_path.join("test_helper.rb")

  bower "angular", "bootstrap", "sugar", "modernizr"
  bundle :install, with: 'binstubs'

  git do
    init
    add '.'
    commit 'Create the new project'
  end
end
