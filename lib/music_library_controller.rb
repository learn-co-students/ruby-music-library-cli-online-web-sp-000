require 'pry'

class MusicLibraryController 
  
  def initialize(path = "./db/mp3s" )
    importer = MusicImporter.new(path)
    importer.import
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
    input = gets.chomp
    if input != exit 
      call
    end 
  end
  
  def list_songs
    sorted = Song.all.sort_by {|song| song.name}
    counter = 1 
    sorted.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end 
  
  def list_artists 
    sorted = Artist.all.sort_by {|artist| artist.name}
    counter = 1 
    sorted.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end 
  
  def list_genres
    sorted = Genre.all.sort_by {|genre| genre.name}
    counter = 1 
    sorted.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    sorted = Song.all.sort_by {|song| song.name}
    counter = 1 
    sorted.each do |song|
      if song.artist.name == input
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    sorted = Song.all.sort_by {|song| song.name}
    counter = 1 
    sorted.each do |song|
      if song.genre.name == input
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i
    sorted = Song.all.sort_by {|song| song.name}
    if (1..sorted.length) === input
      counter = 1 
      selected_song = nil
      sorted.each do |song| 
        if input == counter 
          selected_song = song
        end
        counter += 1 
      end
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end 
    
  
end 