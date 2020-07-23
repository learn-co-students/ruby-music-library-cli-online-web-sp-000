class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    Dir.foreach(@path) {|filename|
      if filename.end_with?(".mp3") && !@files.include?(filename)
        @files << filename
      end
    }
    @files
  end

  def import
    files
    @files.each {|file| Song.create_from_filename(file)}
  end
end
