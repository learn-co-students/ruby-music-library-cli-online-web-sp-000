require 'pry'

class MusicLibraryController
  

  
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
    gets
    gets
    gets
    gets
  end
    
    
  def list_songs 
    
     collection = Song.all.sort_by {|song| song.name}
     
     collection.each_with_index do |song,index|
       puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"

     end
    
  end
  
  def list_artists
    
     collection = Artist.all.sort_by {|a| a.name}
     
     collection.each_with_index do |a,index|
       puts "#{index+1}. #{a.name}"

     end
    end
    
      
  def list_genres
    
     collection = Genre.all.sort_by {|g| g.name}
     
     collection.each_with_index do |g,index|
       puts "#{index+1}. #{g.name}"

     end
    end
    
  def list_songs_by_artist
    
    puts "Please enter the name of an artist:"
    artist = gets   

    a = Artist.find_by_name(artist)
    
    if a != nil 
      
    array = a.songs.sort_by {|song| song.name }
      
    array.each_with_index do |s,index|
        puts "#{index+1}. #{s.name} - #{s.genre.name}"
      end
    
  end
    
  end
  
  
  def list_songs_by_genre
     puts "Please enter the name of a genre:"
     genre = gets 
    
      g = Genre.find_by_name(genre)
      
      if g != nil 
        
      array = g.songs.sort_by {|song| song.name }

    
      array.each_with_index do |s,index|
        puts "#{index+1}. #{s.artist.name} - #{s.name}"
      end
      
    end
    
  end
  
  
  def play_song 
    
    
    
    
    
  
  
  
end

