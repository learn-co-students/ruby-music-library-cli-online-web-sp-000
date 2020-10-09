class MusicImporter
  attr_accessor :path, :song, :artist, :genre

  def initialize(path)
    @path = path
  end

def files
  Dir.entries(@path).select do |file|
    file.end_with? (".mp3")
  end
end

def import
  files.each do |file_name|
    Song.create_from_filename(file_name)
  end
end

end
