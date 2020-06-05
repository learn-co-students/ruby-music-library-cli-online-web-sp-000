#Provides a simple CLI that lets a user browse the library of MP3s imported by song, artist, and genre.

require 'pry'

class MusicLibraryController
  attr_accessor :path

#upon initialization, accepts an optional path to the library
#of MP3 files, defaulting to ./db/mp3s/
#then instantiate a MusicImporter object --> imports songs from the library
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

#method that starts the CLI and prompts the user for input.
  def call
     input = gets.strip #.strip removes the white spaces at the start and end

     if input != exit

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

#prints all songs in the music library in a numbered list (alphabetized by song name)
  def list_songs
#.sort iterates through each song in library and sorts them a-z, alphabetical order
#.each_with_index iterates through each song and puts them in numerical order
#<=> is the spaceship operator useful for sorting an array. compares, <, >, = in a single operation
    Song.all.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
       # ex: expect($stdout).to receive(:puts).with("1. Thundercat - For Love I Come - dance")
    end
  end

#prints all artists in the music library in a numbered list (alphabetized by artist name)
#same methods as above, using .sort, spaceship operator, each with index.
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}"
#ex:expect($stdout).to receive(:puts).with("1. Action Bronson")
    end
  end

# it prints all genres in the music library in a numbered list (alphabetized by genre name)
  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index do |g, i|
      puts "#{i+1}. #{g.name}"
    #  ex: expect($stdout).to receive(:puts).with("2. dance")
    end
  end

# it prompts the user to enter an artist
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
#name = gets.strip captures input without any new lines or extra space
    input = gets.strip #accepts user input.
    if artist = Artist.find_by_name(input)
  #prints all songs by a particular artist in a numbered list (alphabetized by song name)
      artist.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
        puts "#{i+1}. #{s.name} - #{s.genre.name}"
  #ex : expect($stdout).to receive(:puts).with("Please enter the name of an artist:")
        #expect($stdout).to receive(:puts).with("1. Green Aisles - country")
      end
    end
  end

#prompts the user to enter a genre
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip #accepts user input.

    if genre = Genre.find_by_name(input)
      genre.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
        puts "#{i+1}. #{s.artist.name} - #{s.name}"
  # expect($stdout).to receive(:puts).with("Please enter the name of a genre:")
      #expect($stdout).to receive(:puts).with("1. Real Estate - It's Real")
      end
    end
  end

# prompts the user to choose a song from the alphabetized list output by #list_songs
  def play_song
    puts "Which song number would you like to play?"
input = gets.strip.to_i #accepts user input
#.to_i returns the result of interpreting leading chars
#in a string as an integer.

# upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
    if input > 0 && input <= Song.all.length
# it checks that the user entered a number between 1 and the total number of songs in the library

#iterates through all songs and sorts them in alphabetical order
  array = Song.all.sort{|a, b| a.name <=> b.name}
  song = array[input-1]
  puts "Playing #{song.name} by #{song.artist.name}"
#ex:  expect($stdout).to receive(:puts).with("Which song number would you like to play?")
      #expect($stdout).to receive(:puts).with("Playing Larry Csonka by Action Bronson")
  end
end

end
