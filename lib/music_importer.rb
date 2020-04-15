require 'pry'

class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    @path
  end
  
  def import
  
  end
  
end