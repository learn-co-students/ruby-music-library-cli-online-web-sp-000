require 'pry'

class MusicImporter
  attr_accessor :path, :song, :files

  def initialize(path)
    @path=path
    @song=song
  end

  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end

  def import
    files.each {|name| Song.create_from_filename(name)}
  end
end
