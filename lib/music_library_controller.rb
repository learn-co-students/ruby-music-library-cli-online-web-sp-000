require 'pry'

class MusicLibraryController
  def initialize(file_path = './db/mp3s')
    @file_path = file_path
    MusicImporter.new(file_path).import
  end

  def call
    name = ""

    while name != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      name = gets
      name = gets.chomp
    end
  end

  def list_songs
    sorted = Song.all.sort{ |instance1, instance2| instance1.name <=> instance2.name }
    sorted.each.with_index(1) do |instance, index|
      # binding.pry
      puts "#{index}. #{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
    end

  end


end
