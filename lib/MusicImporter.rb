class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{self.path}/*.mp3"].map{|file| file.split("#{self.path}/")[1]}
  end

  def import
    self.files.each{|file| Song.create_from_filename(file)}
  end

end
