require 'pry'

class MusicImporter
  attr_accessor 
  
  def initialize(path)
    @path = path
  end
  
  def path
    @path
  end
  
  def files
    @files = Dir.entries(path).delete_if {|file| !file.include?(".mp3")}
  end
  
  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end
end