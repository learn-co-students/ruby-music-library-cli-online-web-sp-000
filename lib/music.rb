require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def files
    mp3files = File.join(@path, "/*.mp3")
    with_file_paths = Dir.glob(mp3files)
    @filenames = []
    with_file_paths.each do |path_name|
      path_array = path_name.split('/')
      @filenames << path_array[-1]
    end
    @filenames
  end
  def import
  self.files.each do |file|
    Song.create_from_filename(file)
  end
end
end
