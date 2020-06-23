require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").map do |file|
      file.gsub("#{@path}/","")
    end
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end
end
