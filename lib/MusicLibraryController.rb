require 'pry'
class MusicLibraryController 
 extend Concerns::Findable 
  
  def initialize(path = "./db/mp3s")
   @path = path 
   new_object = MusicImporter.new(path) 
   new_object.import 
  end 
  
  def call
    user_input = " "
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
    user_input = gets 
    end 
  end 
  
  def list_songs
   songs = Song.all.sort do |a,b|
     a.name<=>b.name 
   end
   songs.each_with_index do |song, order|
     order+=1 
     puts "#{order}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
  end 
  
  def list_artists 
    artists = Artist.all.sort do |a,b,|
      a.name<=>b.name 
    end 
    
    artists.each_with_index do |artist, order|
      order+=1 
      puts "#{order}. #{artist.name}"
    end 

  end
  
  def list_genres
    genres = Genre.all.sort do |a,b|
      a.name<=>b.name 
  end 
  
    genres.each_with_index do |genre, order|
      order+=1 
      puts "#{order}. #{genre.name}"
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp 
    artist = Artist.find_by_name(input)
     if artist 
       songs = artist.songs.sort do |a,b|
        a.name<=>b.name  
      end 
     songs.each_with_index do |song, order|
      order+=1 
      puts "#{order}. #{song.name} - #{song.genre.name}"
      end
      end 
    end 
    
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre 
      songs = genre.songs.sort do |a,b|
        a.name<=>b.name 
      end 
    songs.each_with_index do |song, order|
      order+=1 
      puts "#{order}. #{song.artist.name} - #{song.name}"
      end 
    end 
  end 
  
  def play_song
     puts "Which song number would you like to play?"
     input = gets.strip.to_i    
      if input.between?(1,Song.all.count)
        
         selected = Song.all
         puts "Playing #{selected[input].name} by #{selected[input].artist.name}"
      end 

      
  end 
  
  
  
end 