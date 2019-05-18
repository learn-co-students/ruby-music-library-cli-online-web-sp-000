require 'pry'
class MusicLibraryController 
 
  
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
    #binding.pry 
   songs = Song.all.sort do |a,b|
     a.name<=>b.name 
   end
    
   songs.each_with_index do |song, order|
     order+=1 
     puts "#{order}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end 
  end 
end 