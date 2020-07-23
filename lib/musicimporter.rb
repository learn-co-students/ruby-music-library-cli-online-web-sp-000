#directory of MP3 files and use the filenames to create instances of Song, Artist, and Genre objects.

class MusicImporter
  attr_accessor :path, :song, :artist, :genre, :musiclibrarycontroller

  def initialize(path) #accepts a file path to parse MP3 files from
    @path = path #file path
  end

  def files
    #returns all imported filenames by using select.
    #select! changes the original array/ object
    #making sure the file ends with .mp3.
    #iterate through each entry in the path
    Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")} #MP3 filename with no path
  end

  def import
    #instantiates a new Song object for each file.
    self.files.each do |filename| #iterates through each filename by going through all files
      Song.create_from_filename(filename) #Song.create imports the files into the library.
    end
  end

end
