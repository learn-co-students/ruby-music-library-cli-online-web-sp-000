require 'pry'
require_relative './concerns.rb'

class MusicLibraryController

  extend Concerns::Findable

  # Upon initialization, accepts an optional path to the library of MP3 files,
  # defaulting to ./db/mp3s/. It should then instantiate a MusicImporter object,
  # which it will use to import songs from the specified library.
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  # Has a #call method that starts the CLI and prompts the user for input.
  def call
    input = ""
    while input != "exit"
    welcome_user = (
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      )
      input = gets.chomp

      case input
      when 'list songs'
          self.list_songs
      when 'list artists'
          self.list_artists
      when 'list genres'
          self.list_genres
      when 'list artist'
          self.list_songs_by_artist
      when 'list genre'
          self.list_songs_by_genre
      when 'play song'
          self.play_song
      else
          "please select a valid option"
      end
    end
  end


  # MUSIC LIBRARY CONTROLLER - CLI METHODS

  # prints all songs in the music library in a numbered list (alphabetized by song name)
  # how do I alphabetize by song name?
  # how do I list out in numbered order
  def list_songs
    # print songs out in alphabetical order with index
    # 'each.with_index' allows for index to start at 1
    Song.all.uniq.sort { |title1, title2| title1.name <=> title2.name }.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  # prints all artists in the music library in a numbered list (alphabetized by artist name)
  def list_artists
    Artist.all.uniq.sort { |artist1, artist2| artist1.name <=> artist2.name}.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  # prints all genres in the music library in a numbered list (alphabetized by genre name)
  def list_genres
    Genre.all.uniq.sort { |genre1, genre2| genre1.name <=> genre2.name}.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  # prompts the user to enter an artist
  # accepts user input
  # prints all songs by a particular artist in a numbered list (alphabetized by song name)
  # does nothing if no matching artist is found
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      sort_by_name = artist.songs.sort_by do |song|
        song.name
      end
      sort_by_name.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  # prompts the user to enter a genre; accepts user input
  # prints all songs by a particular genre in a numbered list (alphabetized by song name)
  # does nothing if no matching genre is found
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      sort_by_name = genre.songs.sort_by do |genre|
        genre.name
      end
      sort_by_name.each.with_index(1) do |genre, i|
        puts "#{i}. #{genre.artist.name} - #{genre.name}"
      end
    end
  end

  # prompts the user to choose a song from the alphabetized list output by #list_songs
  # accepts user input
  # upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
  # does not 'puts' anything out if a matching song is not found
  # checks that the user entered a number between 1 and the total number of songs in the library
  def play_song
    input = gets.chomp.to_i
    puts "Which song number would you like to play?"
    list_of_songs = Song.all.uniq.sort {|a, b| a.name <=> b.name}
    # if input is valid, then puts the matching song
    # how to check for valid input? integer of 1 through length of all songs
    if (1..Song.all.uniq.length).include?(input)
      song = list_of_songs[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end


end
