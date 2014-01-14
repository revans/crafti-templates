require 'pathname'
path              = ::Pathname.new("/Users/robert/dotfiles/crafti-templates").expand_path
template_path     = path.join("/sinatra-gem/templates")
shared_templates  = path.join("shared_templates")


root "triplespot_marketing" do
  mkdir "lib/triplespot_marketing/server/public/stylesheets"
  mkdir "lib/triplespot_marketing/server/public/images"
  mkdir "lib/triplespot_marketing/server/public/fonts"
  mkdir "lib/triplespot_marketing/server/public/javascripts"
  mkdir "lib/triplespot_marketing/server/views"
  mkdir "test/lib"

  touch "Readme.mkd"
  copy  "Rakefile",     template_path.join("Rakefile")
  copy  ".gitignore",   shared_templates.join("gitignore")
  copy  ".bowerrc",     shared_templates.join("bowerrc")
  copy  "Procfile",     shared_templates.join("Procfile")
  copy  "lib/triplespot_marketing/server/views/index.html",
          shared_templates.join("index.html")

  template "Gemfile",
    template_path.join("Gemfile.erb"),
    { ruby_version: '2.1.0' }

  template "triplespot_marketing.gemspec",
    template_path.join("gemspec.erb"),
    { gemname: 'triplespot_marketing',
      appname: 'TriplespotMarketing' }

  template "config.ru",
    template_path.join("config.ru.erb"),
    { appname: 'TriplespotMarketing',
      gemname: 'triplespot_marketing' }

  template "test/test_helper.rb",
    template_path.join("test_helper.rb.erb"),
    { appname: 'TriplespotMarketing',
      library_name: 'triplespot_marketing' }

  template "lib/triplespot_markerting/server",
    template_path.join("test_helper.rb.erb"),
    { appname: 'TriplespotMarketing',
      library_name: 'triplespot_marketing' }
end