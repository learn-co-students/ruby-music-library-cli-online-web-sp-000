class MusicImporter
  
  attr_accessor :path, :song, :artist, :genre
  
  def initialize(path)
    @path = path
  end
  
   def files
    #loads all the mp3 files inthe path directory
    files_to_load = Dir["#{path}/*.mp3"]
    
    #normalizes the filename to just the mp3 filename with no path 
    normalized = [ ]
    files_to_load.collect do |files|
      normalized << files.scan(/[A-Z].+ .+ - .+\.mp3/)
    end
    song_artist_genre = normalized.join(",").split(",")
  end
  
  def import
    new = MusicImporter.new(path)
    new.files.each do |file|
      Song.create_from_filename(file)
    end
  end
  
  
end