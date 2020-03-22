require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect do |song|
      file = song.gsub("#{@path}/", "")
      file
    end
  end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end
end
