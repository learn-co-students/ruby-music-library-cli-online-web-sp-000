class MusicImporter
  attr_accessor :path, :files
  
  def initialize(path)
    @path = path
  end 

  def files
    @files = Dir.entries(@path)
    @files.delete(".")
    @files.delete("..")
    @files
  end 
  
  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end 

end 