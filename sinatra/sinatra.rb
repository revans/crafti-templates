
require 'pathname'
path = ::Pathname.new("/Users/robert/dotfiles/crafti-templates/sinatra/templates").expand_path


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
    path.join('config/application.rb.erb'),
    { app_classname: 'GetTheRundown' }

  template "config.ru",
    path.join('config.ru.erb'),
    { app_classname: 'GetTheRundown' }

  template "Gemfile",
    path.join('Gemfile.erb'),
    { ruby_version: "2.1.0" }

  template ".env.sample",
    path.join('env.sample.erb'),
    { database_name:      "get_the_rundown",
      database_username:  "robert" }

  cp "Rakefile",    path.join("Rakefile")
  cp "Guardfile",   path.join("Guardfile")
  cp "Procfile",    path.join("Procfile")
  cp ".bowerrc",    path.join("bowerrc")
  cp ".foreman",    path.join("foreman")
  cp ".gitignore",  path.join("gitignore")
  cp "test/test_helper.rb",  path.join("test_helper.rb")

  run "bundle install --binstubs"
end
