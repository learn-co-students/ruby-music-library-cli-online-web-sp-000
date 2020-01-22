require 'pry'

class MusicLibraryController

  # Upon initialization, accepts an optional path to the library of MP3 files,
  # defaulting to ./db/mp3s/. It should then instantiate a MusicImporter object,
  # which it will use to import songs from the specified library.
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  # Has a #call method that starts the CLI and prompts the user for input.
  def call
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

    input = ""
    until input == "exit" do
      input = gets.chomp
    end
  end

  # prints all songs in the music library in a numbered list (alphabetized by song name)
  # how do I access the music library?
  # how do I alphabetize by song name?
  # how do I list out in numbered order
  def list_songs

    sorted_song_name = Song.all.sort_by do |song|
      song.name
    end
    sorted_song_name
    binding.pry

  end

end
