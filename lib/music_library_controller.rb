require 'pry'
class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    new = MusicImporter.new(path)
    new.import
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
    input = ""
     while input != "exit"
      input = gets.chomp 
      if input == "list genres"
        list_genres
      elsif input == "list artists"
        list_artists
      elsif input == "list songs"
        list_songs 
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
        
      end   
     end 
  end
  
  def list_songs
    array = alphebetized_list
    array.each.with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end 
  
  def alphebetized_list
    Song.all.sort_by {|a| a.name}
  end 
  
  def list_artists 
    array = Artist.all.sort_by {|a| a.name}
    array.each.with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end 
  
  def list_genres
    array = Genre.all.sort_by {|a| a.name}
    array.each.with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip 
    artists = Artist.find_by_name(input)
     if artists 
      array = artists.songs.sort_by {|a| a.name}
      array.each.with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
     else 
        nil
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip 
    genres = Genre.find_by_name(input)
     if genres 
      array = genres.songs.sort_by {|a| a.name}
      array.each.with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
     else 
        nil
    end 
  end 
    
    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip
      if input.between?("1", "5")
        puts "Playing #{alphebetized_list[input.to_i - 1].name} by #{alphebetized_list[input.to_i - 1].artist.name}"
      else 
        nil
      end 
    end 
  
end 