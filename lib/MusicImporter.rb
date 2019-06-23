# require_relative './Findable.rb'
require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    mp3s = []
    mp3Loc = Dir.new(@path)
    mp3Loc.each do |mp3|
      if mp3.include? "mp3"
        mp3s << mp3
      end
    end
    mp3s
  end
  def import
    files.each do |mp3|
      song = Song.create_from_filename(mp3)
    end
  end
end
