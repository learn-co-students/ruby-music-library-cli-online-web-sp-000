# rspec spec/010_music_library_controller_spec.rb
require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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
    
    input = gets.strip
    while input != "exit"
      call
    break
    end
  end

  def list_songs
    Songs.all.each {|song| puts "#{song.name.sort}"}
    #puts "#{song.name.sort}"
  end

  def list_artists

  end

  def list_genres

  end

  def list_songs_by_artist

  end

  def list_songs_by_genre

  end

  def play_song

  end

  

end