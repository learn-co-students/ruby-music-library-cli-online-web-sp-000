require 'pry'

class MusicLibraryController

  attr_accessor :gets
  attr_reader :path

  def initialize (path = "./db/mp3s")
    # @path = path
    n = MusicImporter.new(path)
    n.import
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
      input = gets.chomp
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
      Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end

  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name}"
    end
  end
  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.name}"
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
      if Artist.find_by_name(input)
      artist = Artist.find_by_name(input)
      songs = artist.songs.sort{|a, b| a.name<=>b.name}
      songs.each.with_index(1) {|s, i| puts "#{i}. #{s.name} - #{s.genre.name}"}
      end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp

      if Genre.find_by_name(input)
      genre = Genre.find_by_name(input)
      songs = genre.songs.sort{|a, b| a.name<=>b.name}
      songs.each.with_index(1) {|s, i| puts "#{i}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
     binding.pry
    if input >= 1 && Song.all.length <= input
      play_list = Song.all.sort{ |a, b| a.name <=> b.name }
      song = play_list[input]
    "Playing #{song.name} by #{song.artist.name}"
    else
    end
  end
end
