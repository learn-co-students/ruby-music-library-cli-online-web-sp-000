require "pry"

class MusicImporter
  attr_accessor :path
  attr_reader  :files

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{@path}/*.mp3").collect do |file|
      file.gsub("#{@path}/", "")
    end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
