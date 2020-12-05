class MusicImporter
  attr_accessor :path

  @files

  def initialize(music_path)
    @path = music_path
    @files = []
    parse_to_files
  end

  def parse_to_files
    dir = Dir.new(path)
    dir.each {|file|
      if(file != "." && file != "..")
        files << file
      end
    }
  end

  def files
    @files
  end

  def import
    files.each {|file|
      song = Song.create_from_filename(file)}
  end
end
