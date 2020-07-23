require 'pry'

class MusicLibraryController
  extend Concerns::Findable

  def initialize(file_path = './db/mp3s')
    @file_path = file_path
    MusicImporter.new(file_path).import
  end

  def call
    user_input = ""

    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_input = gets.chomp

      case user_input
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
    sorted = Song.all.sort{ |instance1, instance2| instance1.name <=> instance2.name }
    sorted.each.with_index(1) do |instance, index|
      # binding.pry
      puts "#{index}. #{instance.artist.name} - #{instance.name} - #{instance.genre.name}"
    end
  end

  def list_artists
    sorted = Artist.all.sort{ |instance1, instance2| instance1.name <=> instance2.name }
    # binding.pry
    sorted.each.with_index(1) do |instance, index|
      puts "#{index}. #{instance.name}"
    end
  end

  def list_genres
    sorted = Genre.all.sort{ |instance1, instance2| instance1.name <=> instance2.name }
    sorted.each.with_index(1) do |instance, index|
      puts "#{index}. #{instance.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    # binding.pry
    if artist = Artist.find_by_name(user_input)
      artist.songs.sort{ |instance1, instance2| instance1.name <=> instance2.name }.each.with_index(1) do |instance, index|
          puts "#{index}. #{instance.name} - #{instance.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip

    if genre = Genre.find_by_name(user_input)
      genre.songs.sort{ |instance1, instance2| instance1.name <=> instance2.name }.each.with_index(1) do |instance, index|
        puts "#{index}. #{instance.artist.name} - #{instance.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i

    if song = Song.all.sort{ |instance1, instance2| instance1.name <=> instance2.name }[user_input - 1]
      # binding.pry
      if user_input > 1 && user_input <= Song.all.length
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
