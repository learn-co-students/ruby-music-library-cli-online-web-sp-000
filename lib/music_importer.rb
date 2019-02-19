require "pry"

class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
    @filenames = []
  end
  
  def files
    filename = Dir["#{@path}/*.mp3"]
    filename.each do |f|
      @filenames << f.split("/").last
    end
    @filenames
  end
  
  def import
    files.each do |song|
    Song.create_from_filename(song)
    end
  end
  
  
end