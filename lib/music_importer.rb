class MusicImporter

  attr_accessor :path

  def initialize(filename)
    @path = filename
  end

  def files
    @files ||= Dir.entries(@path).select {|song| !File.directory?(song) && song.end_with?(".mp3")}
  end

  def import
    files.each{|filename| Song.create_from_filename(filename)}
  end
end
