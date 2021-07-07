require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|i| i[/\.mp3/]}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end


end


# test = MusicImporter.new("./spec/fixtures/mp3s")
# binding.pry
