require 'pry'

class MusicLibraryController
  
  attr_accessor :music, :songs, :done
  
  def initialize(path="./db/mp3s")
    
    @music = MusicImporter.new(path)
    @music.import
    @done = false
    
  end
  
  def call 
    
    puts "Welcome to your music library!"
    
    until (@done)
    
      start
      
    end
    
    
  end
  
  
  def start
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    input = gets.strip
    
    case input
      
      when input="list songs"
        list_songs
        
      when input="list artists"
        list_artists
        
      when input="list genres"
        list_genres
        
      when input="list artist"
        list_songs_by_artist
        
      when input="list genre"
        list_songs_by_genre
        
      when input="play song"
        play_song
        
      when input="exit"
        @done = true
    
    end
    
  end
  
  def list_songs
   
    #binding.pry
    
    Song.sort_by_name.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
   
   #binding.pry
      Artist.sort_by_name.each_with_index{|artist, index| puts "#{index+1}. #{artist.name}"}
    
  end
  
  def list_genres
   
   #binding.pry
      Genre.sort_by_name.each_with_index{|genre, index| puts "#{index+1}. #{genre.name}"}
    
  end
  
  def list_songs_by_artist
   
    puts "Please enter the name of an artist:"
    input = gets.strip
    Song.all.select{|song|song.artist.name == input}.sort{|song_1, song_2| song_1.name <=> song_2.name}.each_with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    
    
  end
  
  def list_songs_by_genre
   
    puts "Please enter the name of a genre:"
    input = gets.strip
    Song.all.select{|song|song.genre.name == input}.sort{|song_1, song_2| song_1.name <=> song_2.name}.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    
  end
  
  def play_song
    
    puts "Which song number would you like to play?"
    #list_songs
    input = gets.strip.to_i
    #binding.pry
    if (input.between?(1, Song.all.length))
      play_song = Song.sort_by_name[input-1]
      #binding.pry
      puts "Playing #{play_song.name} by #{play_song.artist.name}"
    end
  end
  

  
  
end


