require 'pry'

class MusicLibraryController
  
  
  def initialize(path='./db/mp3s')
    new_import = MusicImporter.new(path)
    new_import.import
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
    loop do
      input = gets.strip
      if input == 'exit'
        break
        elsif input == 'list songs'
          list_songs
        elsif input == 'list artists'
          list_artists
        elsif input == 'list genres'
          list_genres
        elsif input == 'list artist'
          list_songs_by_artist
        elsif input == 'list genre'
          list_songs_by_genre
        elsif input == 'play song'
          play_song
      end
    end
  end
  
  def list_songs
    sorted_songs = Song.all.sort_by { |song| song.name}
    song_array = sorted_songs.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    song_array.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort_by { |artist| artist.name}
    sorted_artists.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end
  
  def list_genres 
    sorted_genres = Genre.all.sort_by { |genre| genre.name}
    sorted_genres.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    sorted_songs = Song.all.sort_by { |song| song.name}
    counter = 1
    sorted_songs.each do |song|
      if user_input == song.artist.name
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    sorted_songs = Song.all.sort_by { |song| song.name}
    counter = 1
    sorted_songs.each do |song|
      if user_input == song.genre.name
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    index = gets.strip.to_i - 1
    sorted_songs = Song.all.sort_by { |song| song.name}
    if index < Song.all.size && index >= 0
      puts "Playing #{sorted_songs[index].name} by #{sorted_songs[index].artist.name}"
    end
  end
  
  
end