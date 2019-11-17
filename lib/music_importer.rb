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

  def self.import

  end

end
