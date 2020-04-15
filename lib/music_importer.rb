require 'pry'

class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end

  def files
    @path = Dir["./spec/fixtures/mp3s"].each {|file| require file }
    # binding.pry
  end
  
  def import
  
  end
  
end