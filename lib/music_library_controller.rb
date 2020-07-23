require 'pry'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    @importer = MusicImporter.new(path).import
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
    
    input = ''
    until input == 'exit' do 
      input = gets.chomp
      case input
      when 'list songs'
        list_songs 
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song 
      end
    end
  end
  
  def list_songs
    Song.list_all
  end 
  
  def list_artists
    Artist.list_all
  end
  
  def list_genres
    Genre.list_all
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    songs = Song.all.select { |song| song.artist.name == artist_name }
    songs.sort_by! { |song| song.name }
    songs.each.with_index(1) { |song, index| puts "#{index}. #{song.name} - #{song.genre.name}" }
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    songs = Song.all.select { |song| song.genre.name == genre_name }
    songs.sort_by! { |song| song.name }
    songs.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name}" }
  end 
  
  def play_song
    
      puts "Which song number would you like to play?"
      selection = gets.chomp.to_i
      if selection > 0 && selection < Song.all.size + 1
        song = Song.all_sorted_by_name[selection - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
  end
    
end 