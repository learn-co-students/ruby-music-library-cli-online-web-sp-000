class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).reject{|i| i == "." || i == ".."}
  end
end
