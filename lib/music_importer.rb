class MusicImporter
  
  attr_reader :path
  def initialize(path)
    @path = path
  end

  def files
    files = Dir.glob("#{self.path}/*.mp3")
    files.map{|file| File.basename(file)}
  end

  def import
    self.files.each {|filename| Song.create_from_filename(filename)}
  end

end