class MusicImporter

  attr_accessor :path, :song, :musiclibrarycontroller

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect { |file| file.gsub("#{@path}/", "")}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end
