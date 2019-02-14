require 'pry'

class MusicLibraryController
  def initialize(path="./db/mp3s")
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    input = nil
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets
    end
  end

  def list_songs
    #prints all songs in music library in numbered list, alphabetized by song name
  end

  def list_artists
    #prints all artists in music library in numbered list, alphabetized by artist name
  end

  def list_genres
    #prints all genres in music library in numbered list, alphabetized by genre name
  end

  def list_songs_by_artist
    #prompts user to enter artist
    #prints all songs by that artist in a numbered list
    #does nothing if no matching artist
  end

  def list_songs_by_genre
    #prompts user to enter genre
    #prints all songs in that genre in a numbered list
    #does nothing if no matching genre
  end

  def play_song
    #prompts user to choose song from list_songs output
  end

end
