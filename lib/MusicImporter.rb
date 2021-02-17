require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    files = Dir.entries("#{path}")
    files = files.find_all{|x| x.include?(".mp3")}
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

end
