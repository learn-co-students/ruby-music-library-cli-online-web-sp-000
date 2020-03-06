require 'pry'

class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.entries(path).select {|entry| entry.include?("mp3")}
  end
  
  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end