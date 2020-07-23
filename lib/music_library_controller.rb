require 'pry'

class MusicLibraryController
  attr_accessor :library
  def initialize(path = "./db/mp3s")
    @library = MusicImporter.new(path)
    @library.import
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
        abort "See ya later!"
    end
  end

  def list_songs
    sorted_by_song_name = Song.all.sort_by! { |song| song.name }
    sorted_by_song_name.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted_by_artist_name = Artist.all.sort_by! { |artist| artist.name }
    sorted_by_artist_name.each_with_index { |artist, index| puts "#{index + 1}. #{artist.name}"}
  end

  def list_genres
    sorted_by_genres_name = Genre.all.sort_by! { |genre| genre.name }
    sorted_by_genres_name.each_with_index { |genre, index| puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.sort_by { |song| song.name }.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre.songs.sort_by { |song| song.name }.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number.class == Integer && song_number > 0
      song_number_index = song_number - 1
      sorted_by_song_name = Song.all.sort_by! { |song| song.name }
      song = sorted_by_song_name[song_number_index]
      puts "Playing #{song.name} by #{song.artist.name}" unless song.nil?
    end
  end
end