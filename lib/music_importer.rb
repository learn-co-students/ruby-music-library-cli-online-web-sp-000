require 'pry'
require 'set'

class MusicImporter

  attr_accessor :path

  @@files = []

  def initialize(path)
    @path = path
  end

  def files

    # Dir["db/mp3s/*"].each do |file|
    Dir[@path + "/*"].each do |file|
      # @@files << file.gsub("db/mp3s/","")
      @@files << file.gsub(@path +"/","")
    end
    @@files

  end

  def import
    Dir[@path + "/*"].each do |file|
      filename = file.gsub(@path +"/","")
      Song.create_from_filename(filename)
    end
  end

end
