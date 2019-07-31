require 'pry'

class MusicImporter
  attr_accessor :path, :files
  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.chdir(@path) do | path |
      Dir.glob("*.mp3")
    end
    @files
  end

  def import
   files()
   @files.each do |file|
      Song.create_from_filename(file)
      @@all << file
    end
  end

  def self.all
    @@all 
  end
end
