require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
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
      end
    end

  end

  def list_songs
    song_sorted = Song.all.sort { |a, b| a.name <=> b.name }
    song_sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    song_sorted = Artist.all.sort { |a, b| a.name <=> b.name }
    song_sorted.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    song_sorted = Genre.all.sort { |a, b| a.name <=> b.name }
    song_sorted.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    input = ""
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    #binding.pry
    if artist != nil
      artist_sorted = artist.songs.sort { |a, b| a.name <=> b.name }
      artist_sorted.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end

  end

  def list_songs_by_genre
    input = ""
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    #binding.pry
    if genre != nil
      genre_sorted = genre.songs.sort { |a, b| a.name <=> b.name }
      genre_sorted.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end

  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    songs = Song.all

    if (1..songs.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end
    # binding.pry

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end


end
