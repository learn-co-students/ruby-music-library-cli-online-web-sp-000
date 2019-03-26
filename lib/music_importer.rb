require "pry"

class MusicImporter
  attr_accessor :path
  attr_reader  :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    # binding.pry
    @files ||= Dir.glob("#{@path}/*.mp3").map do |file|
      file.gsub("#{@path}/", "")
    # @files
    binding.pry
  end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
