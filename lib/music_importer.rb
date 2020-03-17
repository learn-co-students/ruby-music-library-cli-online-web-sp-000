class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
    @files = Dir.entries(path).grep(/.+\.mp3/)
  end

  def import
    @files.collect {|filename| Song.create_from_filename(filename)}
  end
end
