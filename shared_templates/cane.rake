  require 'cane/rake_task'

namespace :metrics do
  desc "Run cane to check quality metrics"
  Cane::RakeTask.new(:quality) do |cane|
    cane.abc_max      = 10
    cane.no_style     = false
    cane.abc_exclude  = %w(Foo::Bar#some_method)
    cane.add_threshold 'coverage/covered_percent', :>=, 99
  end

  task :default => :quality
end