require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")

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
      when "exit"
        exit
      else
        call
    end
  end

  # MusicLibraryController - CLI Methods

  def list_songs
    sorted_library = Song.all.sort_by  {|song| song.name}
    counter = 1
    sorted_library.each do |song|
      puts"#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
    call
  end

  def list_artists
    sorted_library = Artist.all.sort_by  {|artist| artist.name}
    counter = 1
    sorted_library.each do |artist|
      puts"#{counter}. #{artist.name}"
      counter += 1
    end
    call
  end

  def list_genres
    sorted_library = Genre.all.sort_by  {|genre| genre.name}
    counter = 1
    sorted_library.each do |genre|
      puts"#{counter}. #{genre.name}"
      counter += 1
    end
    call
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp

    counter = 1

    if artist = Artist.find_by_name(user_input)
      sorted_library = artist.songs.sort_by {|song| song.name}
      sorted_library.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
    call
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp

    counter = 1

    if genre = Genre.find_by_name(user_input)
      sorted_library = genre.songs.sort_by {|song| song.name}
      sorted_library.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
    call
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i

    sorted_library = Song.all.sort_by  {|song| song.name}

    if user_input.between?(1, sorted_library.length)
      song_choice = sorted_library[user_input - 1]
      puts "Playing #{song_choice.name} by #{song_choice.artist.name}"
    end
    call
  end
end
