class MusicImporter
  attr_accessor :path, :song, :artist, :genre, :musiclibrarycontroller
  
  def initialize(file)
    @path = file
  end

  def files
    Dir.entries(@path).select! {|x| x.end_with?(".mp3")}
  end

  def import
    self.files.each {|x|Song.create_from_filename(x)}
  end
end 