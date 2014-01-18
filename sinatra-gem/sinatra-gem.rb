require 'pathname'
path              = ::Pathname.new("/Users/robert/dotfiles/crafti-templates").expand_path
template_path     = path.join("sinatra-gem/templates")
shared_templates  = path.join("shared_templates")

filename  = 'triplespot_marketing'
classname = 'TriplespotMarketing'


root filename do
  mkdir "lib/#{filename}/server/public/stylesheets"
  mkdir "lib/#{filename}/server/public/images"
  mkdir "lib/#{filename}/server/public/fonts"
  mkdir "lib/#{filename}/server/public/javascripts"
  mkdir "lib/#{filename}/server/views"
  mkdir "lib/#{filename}/server/config"
  mkdir "test/#{filename}"

  touch "Readme.mkd"
  copy  "Rakefile",     template_path.join("Rakefile")
  copy  ".gitignore",   shared_templates.join("gitignore")
  copy  ".bowerrc",     shared_templates.join("bowerrc")
  copy  "Procfile",     shared_templates.join("Procfile")
  copy  "lib/#{filename}/server/views/index.html",
          shared_templates.join("index.html")

  template "Gemfile",
    template_path.join("Gemfile.erb"),
    { ruby_version: '2.1.0' }

  template "#{filename}.gemspec",
    template_path.join("gemspec.erb"),
    { gemname: filename,
      appname: classname }

  template "config.ru",
    template_path.join("config.ru.erb"),
    { appname: classname,
      gemname: filename }

  template "test/test_helper.rb",
    template_path.join("test_helper.rb.erb"),
    { appname:        classname,
      library_name:   filename }

  template "lib/#{filename}/server.rb",
    template_path.join("server.rb.erb"),
    { appname: classname }

  template "lib/#{filename}/version.rb",
    template_path.join("version.rb.erb"),
    { appname: classname }

  template "lib/#{filename}/server/config/application.rb",
    template_path.join("application.rb.erb"),
    { appname: classname }

  run "bundle install --binstubs"
  run "git init"
  run "git add ."
  run "git commit -m 'Initial Commit for Project Creation'"

end