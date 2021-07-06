require 'pry'
class MusicImporter
  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir[self.path + "/**/*.{mp3}"]
    files.collect {|file| file.split("/").last}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
