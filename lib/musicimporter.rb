# rspec spec/009_music_importer_spec.rb

class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*.mp3").map{|f|File.basename(f)}
  end

  def import
    files.each {|filename| Song.create_from_filename(filename)}
  end

end