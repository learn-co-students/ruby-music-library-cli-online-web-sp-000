class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  
  def files
    Dir["#{@path}/*"].collect { |fpath| File.basename(fpath)  }
  end
  
  def import
    files.each { |song_path| Song.create_from_filename(song_path) }
  end
  
  def call
    user_input = ""
    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.strip!
    end
  end
  
  def list_songs
  end

  def list_artists
  end
  
  
  def list_genres
  end

  def list_songs_by_artist
  end
  
  def list_songs_by_genre
  end

  def play_song
  end
  
end