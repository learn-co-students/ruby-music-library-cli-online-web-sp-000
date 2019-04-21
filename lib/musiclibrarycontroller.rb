
require 'pry'

class MusicLibraryController 
  
  attr_accessor :music 
  
  def initialize(path = "./db/mp3s")
    @path = path 
    @music = MusicImporter.new(path)
    @music.import 
  end 
  
  def call 
    puts "Welcome to your music library!"
    input = ""
      
    while input != 'exit' do 
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
        when "list songs"
          list_songs 
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_artist 
        when "list genre"
          list_genre
        when "play song"
          play_song
      end 
    end 
  end 
  

  
  def list_genres
    #sort by genre 
    sorted = Genre.all.sort{|a, b| a.name <=> b.name}
    
    sorted.each_with_index do |g, i|
      puts "#{i+1}. #{g.name}"
    end
  end 
  
  
  def list_artists
    #sort by name 
    sorted = Artist.all.sort{|a, b| a.name <=> b.name}
    
    sorted.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}"
    end
  end 
  
  
  def list_songs 
    sorted = Song.all.sort{|a, b| a.name <=> b.name}
    sorted.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end   
  end 
  

  
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    #check if artist is found 
    if artist = Artist.find_by_name(input)
      #sort by name the list of songs in artist.songs
      sorted = artist.songs.sort{|a, b| a.name <=> b.name}
      sorted.each_with_index do |s, i|
        puts "#{i+1}. #{s.name} - #{s.genre.name}"
      end
    end
  end 
  
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    input = gets.strip
    
    #check if genre is found 
    if genre = Genre.find_by_name(input)
      #sort by name the list of songs in genre.songs
      sorted = genre.songs.sort{|a, b| a.name <=> b.name}
      sorted.each_with_index do |s, i|
        puts "#{i+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end 
  
  def list_artist 
    list_songs_by_artist
  end 
  
  def list_genre 
    list_songs_by_genre
  end 
  
  
  def play_song 
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    if input.between?(1, Song.all.size)
      sorted = Song.all.sort{|a, b| a.name <=> b.name}
      song = sorted[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end 
  end 
  
  
end 
