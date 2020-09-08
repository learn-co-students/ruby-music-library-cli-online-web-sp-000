require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(filename)
    @path = filename
  end

  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end

  def import
    song_list = files
    # binding.pry
    song_list.collect {|v| Song.create_from_filename(v)}
  end

end
