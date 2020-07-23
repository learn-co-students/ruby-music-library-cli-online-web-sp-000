class MusicImporter
  #the attr_accessor path retrieves the path provided to the MusicImporter object
  attr_accessor :path

  #accepts a file path to parse MP3 files from
  def initialize(path)
    @path = path
  end

  #loads all the MP3 files in the path directory
  #normalizes the filename to just the MP3 filename with no path
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  #imports the files into the library by invoking Song.create_from_filename
  def import
    files.each {|file| Song.create_from_filename(file)}
  end

end
