require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call

  user_input = " "
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

  user_input = gets.strip

  case user_input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artists'
        self.list_artists
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      else
        "Type in a valid request please"
      end
    end
  end


  def list_songs

  Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
    puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end


  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
        puts "#{i}. #{a.name}"
    end
  end

  def list_genres

    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
          puts "#{i}. #{g.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
    artist.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
    genre.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i

    songs = Song.all

    if (1..songs.length).include?(user_input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[user_input - 1]
    end
    # binding.pry

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end





end
