
class MusicLibraryController
  attr_accessor :path
  
  
  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call 
    input = "" #acts as a switch for the while loop
    while (input != "exit")
      input = gets.strip
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      case input
        when "list songs" #==input 
          self.list_songs
        when "list artists"
          self.list_artists
        when "list genres"
          self.list_genres
        when  "list artist"
          self.list_songs_by_artist
        when "list genre"
          self.list_songs_by_genre
        when "play song"
          self.play_song
      end
      
    end
  end
  
  def list_songs
    #we will need all the songs plus their indexes to number the list.
    #Song.all will give us alll instances of the song class
    #we want a custom sorting method to sort instances by name.
    #the final product should be the format 1.artist - name - genre.
    Song.all.sort {|a, b| a.name <=> b.name}.each_with_index do |song_instance, index|
      puts "#{index + 1}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index do |artist_instance, index|
      puts "#{index + 1}. #{artist_instance.name}"
    end
  end
  
  def list_genres
    Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index do |genre_instance, index|
      puts "#{index + 1}. #{genre_instance.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    #format looks to be 1. song - genre
    if Artist.find_by_name(input) #is truthy
      Artist.find_by_name(input).songs.sort {|a, b| a.name <=> b.name}.each_with_index do |song_instance, index|
      puts "#{index + 1}. #{song_instance.name} - #{song_instance.genre.name}"
    end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input) #is truthy
      Genre.find_by_name(input).songs.sort {|a, b| a.name <=> b.name}.each_with_index do |song_instance, index|
      puts "#{index + 1}. #{song_instance.artist.name} - #{song_instance.name}"
    end
    end
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    sorted_array = Song.all.sort {|a, b| a.name <=> b.name}
    if input <= sorted_array.length && input > 0
      song = sorted_array[input - 1].name
      artist = sorted_array[input-1].artist.name
      puts "Playing #{song} by #{artist}"
    end
  end
  
end