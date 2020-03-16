require 'pry'

class MusicImporter
attr_accessor :path


@@all = []

def initialize(path)
  @path = path
  @files = []
  Dir.foreach(@path) do |filename|
  next if filename == "." || filename == ".."
  @files << filename
  end
end

  def files
    @files
  end

def import
files.each {|file| Song.create_from_filename(file)}
end



end
