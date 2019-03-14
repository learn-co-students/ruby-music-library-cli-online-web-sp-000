class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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
    
    input = ""
    while input != 'exit'
      puts "What would you like to do?"
      input = gets
      
      list_songs if input == "list songs"
      list_artists if input == "list artists"
      list_genres if input == "list genres"
      list_songs_by_artist if input == "list artist"
      list_songs_by_genre if input == "list genre"
      play_song if input == "play song"
    end
  end
  
  def list_songs
    Song.all.sort { |a,b| a.name <=> b.name }.each_with_index { |song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end
  
  def list_artists
    Artist.all.sort { |a,b| a.name <=> b.name }.each_with_index { |artist, i| puts "#{i+1}. #{artist.name}" }
  end
  
  def list_genres
    Genre.all.sort { |a,b| a.name <=> b.name }.each_with_index { |genre, i| puts "#{i+1}. #{genre.name}" }
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    Song.all.delete_if { |song| song if song.artist.name != artist }.sort { |a, b| a.name <=> b.name }.each_with_index { |song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}" }
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    Song.all.delete_if { |song| song if song.genre.name != genre }.sort { |a, b| a.name <=> b.name }.each_with_index { |song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}" }
  end
  
  def play_song
    puts "Which song number would you like to play?"
    num = gets.to_i
    songs = Song.all.sort { |a, b| a.name <=> b.name }
    if num < 1 || num > songs.length
      return
    end
    puts "Playing #{songs[num-1].name} by #{songs[num-1].artist.name}"
  end
end
