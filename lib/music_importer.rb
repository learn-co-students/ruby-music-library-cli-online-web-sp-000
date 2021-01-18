class MusicImporter 
  attr_accessor :path, :musiclibrarycontroller
  
  def initialize(path)
    @path = path 
  end 
  
  def files 
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end
  
  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end
end 