class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = Dir.entries(path).grep(/.+\.mp3/)
  end

end
