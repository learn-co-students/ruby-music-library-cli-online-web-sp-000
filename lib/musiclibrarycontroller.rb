require 'pry'

class MusicLibraryController
  
  extend Concerns::Findable
  
  attr_accessor :path
  

  def initialize(path = "./db/mp3s")
    i = MusicImporter.new(path)
    i.import
  end
  
  def call
    input = ""
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip #until @input == "exit"
    
    case input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    end
    
    end
    
  end
  
  def list_songs
    array = Song.all.sort {|a,b| a.name <=> b.name}
    array.each_with_index do |x, index|
      index += 1
      puts "#{index}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end
  
  def list_artists
    array = Artist.all.sort {|a,b| a.name <=> b.name}
    array.each_with_index do |x, index|
        index += 1
      puts "#{index}. #{x.name}"
      
      end
  end
  
  def list_genres
    array = Genre.all.sort {|a,b| a.name <=> b.name}
    array.each_with_index do |x, index|
        index += 1
      puts "#{index}. #{x.name}"
      
      end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
   
   if artist = Artist.find_by_name(input)
      array = artist.songs.sort {|a,b| a.name <=> b.name}
      array.each_with_index do |s, index|
        index += 1
        puts "#{index}. #{s.name} - #{s.genre.name}"
      end
    end
    
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      array = genre.songs.sort {|a,b| a.name <=> b.name}
      array.each_with_index do |s, index|
        index += 1
        puts "#{index}. #{s.artist.name} - #{s.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    f = input.to_i
    j = Song.all.length
    if (1..j).include?(f)
      songs = Song.all.sort {|a,b| a.name <=> b.name}
      x = songs.at(f - 1)
      puts "Playing #{x.name} by #{x.artist.name}"
    end
  end

    
  end
  
    
  
  