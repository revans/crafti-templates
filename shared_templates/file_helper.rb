require 'pathname'

module FileHelper
  def asset_path
    Application.root.join('test/assets')
  end

  def read_file(filename)
    asset_path.join(filename).read
  end

  def open_file(filename)
    asset_path.join(filename).to_s
  end

  def write_fixture_file(filename, content)
    ::File.open(asset_path.join(filename), 'w+') { |f| f.puts content.to_json }
  end

  def fixture_data(name)
    YAML.dump(asset_path.join(name).read)
  end
end