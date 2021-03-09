class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call
    input = ""
    until input == "exit" do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      input = gets.chomp
      
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
      
    end
  end
  
  def list_songs
    songs = Song.alphabetical
    index = 1
    
    songs.each do |song|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      index += 1
    end
    return songs
  end
  
  def list_artists
    artists = Artist.alphabetical
    index = 1
    
    artists.each do |artist|
      puts "#{index}. #{artist.name}"
      index += 1
    end
  end
  
  def list_genres
    genres = Genre.alphabetical
    index = 1
    
    genres.each do |genre|
      puts "#{index}. #{genre.name}"
      index += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    index = 1
    
    if artist != nil
      artist.songs.sort{ |a, b| a.name <=> b.name }.each do |s|
        puts "#{index}. #{s.name} - #{s.genre.name}"
        index += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    index = 1
    
    if genre != nil
      genre.songs.sort{ |a, b| a.name <=> b.name }.each do |s|
        puts "#{index}. #{s.artist.name} - #{s.name}"
        index += 1
      end
    end
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    index = gets.chomp.to_i
    
    songs = Song.alphabetical
    
    if (1..songs.length).include?(index)
      puts "Playing #{songs[index - 1].name} by #{songs[index - 1].artist.name}"
    end
    
  end 




  
end