require 'pry'

class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
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
      end
    end


  end

  def list_songs
    counter = 1
    sorted_songs = Song.all.uniq.sort_by { |song| song.name }
    sorted_songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    sorted_artists = Artist.all.uniq.sort_by { |artist| artist.name }
    sorted_artists.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    sorted_genre = Genre.all.uniq.sort_by { |genre| genre.name }
    sorted_genre.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    songs_by_artist = Song.all.find_all { |song| song.artist.name == input }
    counter = 1
    sorted_songs = songs_by_artist.uniq.sort_by { |song| song.name }
    sorted_songs.each do |song|
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    songs_by_genre = Song.all.find_all { |song| song.genre.name == input }
    counter = 1
    sorted_songs = songs_by_genre.uniq.sort_by { |song| song.name }
    sorted_songs.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    sorted_songs = Song.all.uniq.sort_by { |song| song.name }
    song = sorted_songs[input - 1]
    if song != nil && input > 0 && input <= sorted_songs.length
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
