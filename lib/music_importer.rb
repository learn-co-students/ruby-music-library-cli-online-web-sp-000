require "pry"

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir["#{path}/*"]
    @files.map! do |filename|
      filename.sub("#{path}/","")
    end
  end

  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end
end
