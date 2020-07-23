require 'pry'

class MusicImporter
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
    @files = []
  end  
  
  def files
    x = Dir.entries(path)
    x.delete("..")
    x.delete(".")
    @files = x
  end 
  
  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end 
  
end