require 'pry'
class MusicLibraryController
  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    @path=path
    importer=MusicImporter.new(path)
    @songs=importer.import
  end
  
  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")
    
    input=""
    until input=="exit" 
    input=gets
    if input=='list songs'
      list_songs
    elsif input=='list artists'
      list_artists
    elsif input=='list genres'
      list_genres
    elsif input=='list artist'
      list_songs_by_artist
    elsif input=='list genre'
      list_songs_by_genre
    elsif input=='play song'
      play_song
      
    end
  end
  
  
 end
 
    def ordered_file
      files=Dir.entries(path).select{|file| file.end_with? '.mp3'}
      files.collect{|file| file.split(" - ")}.sort_by{|i| i[1]}.collect{|i| i.join(" - ")}
    end
    
    def list_songs
      
      count=1
      ordered_file.each do |file|
        puts"#{count}. #{file.chomp(".mp3")}"
        count+=1
      end
      
   end
   
   def list_artists
     count=1
      Artist.all.collect{|i| i.name}.sort.each do |i|
        puts "#{count}. #{i}"
        count+=1
      end
      
   end
   
   def list_genres
     count=1
      Genre.all.collect{|i| i.name}.sort.each do |i|
        puts "#{count}. #{i}"
        count+=1
      end
   end
   
def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    
    counter = 1
    Song.all.sort_by {|song| song.name}.each do |song|
      if artist == song.artist.name
        puts ("#{counter}. #{song.name} - #{song.genre.name}")
        counter += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    
    counter = 1
    Song.all.sort_by {|song| song.name}.each do |song|
      if genre == song.genre.name
        puts ("#{counter}. #{song.artist.name} - #{song.name}")
        counter += 1
      end
    end
  end
  
  def play_song
    
    puts "Which song number would you like to play?"
    song=gets.to_i
    if song> 0 && song<ordered_file.size
    new_file=ordered_file[song-1].split(" - ")
    puts "Playing #{new_file[1]} by #{new_file[0]}"
  end
  end

end