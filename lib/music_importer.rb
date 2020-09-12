class MusicImporter
  
 attr_accessor :path, :song, :artist, :genre, :musiclibrarycontroller
  
  def  initialize(path)
    @path = path
  end
  
  def files
    Dir.entries(@path).select {|files| files.end_with?(".mp3")}
  end
  
  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end