class MusicLibraryController

  extend Concerns::Findable
  
  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    @songs = music_importer.import
  end  

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts"To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    exit_value = ""
    while exit_value != "exit"
      user_input = gets.chomp
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_artist
      elsif user_input == "list genre"
        list_genre
      elsif user_input == "play song"
        play_song
      elsif user_input == "exit"
        exit_value = user_input
      end
    end
  end
  
  def list_songs
  end
  
  def list_artists
  end
  
  def list_genres
  end
  
  def list_artist
  end
  
  def list_genre
  end
  
  def play_song
  end
end