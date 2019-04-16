class MusicLibraryController
  def initialize(path="./db/mp3s")
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
    puts "What would you like to do?"
    input = nil
    until input == "exit"
      input = gets.chomp
    end
  end
  
  def list_songs
    alphabetical_songs = Song.alphabetical
    alphabetical_songs.each do |song|
      puts "#{alphabetical_songs.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    alphabetical_artists = Artist.alphabetical
    alphabetical_artists.each do |artist|
      puts "#{alphabetical_artists.index(artist) + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    alphabetical_genres = Genre.alphabetical
    alphabetical_genres.each do |genre|
      puts "#{alphabetical_genres.index(genre) + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input)
      artist = Artist.find_by_name(input)
      alphabetical_songs = artist.songs.sort_by{|song| song.name}
      alphabetical_songs.each do |song|
        puts "#{alphabetical_songs.index(song) + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
      genre = Genre.find_by_name(input)
      alphabetical_songs = genre.songs.sort_by{|song| song.name}
      alphabetical_songs.each do |song|
        puts "#{alphabetical_songs.index(song) + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    
  end
end