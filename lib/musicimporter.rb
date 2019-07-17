class MusicImporter
  attr_accessor :path          #retrieves the path provided to the MusicImporter object

  def initialize(path)         #accepts a file path to parse MP3 files from
    @path = path
  end

  def files                   #loads all the MP3 files in the path directory
    #@files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    Dir.entries(path).select {|entry| entry.include?(".mp3")}
  end

  def import
    files.each{ |file| Song.create_from_filename(file) }

  end
end
