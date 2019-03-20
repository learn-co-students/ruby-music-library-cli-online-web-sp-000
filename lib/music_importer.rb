require 'pry'

class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    temp = Dir.glob("#{@path}/*.mp3")
    temp.each do |file_name|
      @files << file_name.split('/').last
    end
    @files
  end

  def import
    files.each { |filename| Song.create_from_filename(filename) }
  end
end
