class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{@path}/*.mp3"]
    files.collect{|file| file.partition("#{@path}/")[2]}
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
