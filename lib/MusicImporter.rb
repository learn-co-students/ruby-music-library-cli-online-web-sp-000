class MusicImporter
  require 'pry'
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.glob("#{path}/*.mp3").collect{|mp3| mp3.gsub("#{path}/", "")}
  end

end