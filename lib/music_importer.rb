class MusicImporter
  attr_accessor :path, :song, :artist, :genre

  @@files = []

  def initialize(path)
    @path=path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}
  end

  def import
    files.each {|name| Song.create_from_filename(name)}
  end
end
