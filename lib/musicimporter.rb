class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    #returns all imported filenames
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |i| i.gsub("#{path}/", "") }
  end
  
  def import
    #imports all of the files from the library, instantiating a new song object for each file
    files.each{|i| Song.create_from_filename(i)}
  end
  
  
  
end