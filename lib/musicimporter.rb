class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  
  def files
    Dir["#{@path}/*"].collect { |fpath| File.basename(fpath)  }
  end
  
  def import
    files.each { |song_path| Song.create_from_filename(song_path) }
  end

  
  
end