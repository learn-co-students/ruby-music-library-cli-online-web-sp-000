class MusicImporter
  attr_accessor :files
  attr_reader :path

  def initialize(path)
    @path = path
    @files = []
  end
  
  def files
    @files = Dir.entries(@path).select {|file| File.extname(file) == ".mp3" }
  end

  def import
    files.each { |file_name|  Song.create_from_filename(file_name) }
  end
end
