class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    file_list = []
    Dir["#{path}/*.mp3"].each do |file|
      file = file.split("/") # "Song - artist - genre.mp3"
      file_list.append(file[4])
    end
    file_list  #returns the filenames
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end

class MusicLibraryController
  def initialize(path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    reply = gets
    exit
  end
end
