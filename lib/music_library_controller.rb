require "pry"
require_relative "../lib/song.rb"
class MusicLibraryController

  def initialize(path = './db/mp3s')
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

    input = gets.chomp.downcase

    unless input == "exit"
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
      call
    end
  end

  def list_songs
    Song.all.sort_by {|song| song.name}.each_with_index {|song, idx| puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    artists_from_song_class = Song.all.collect {|song| song.artist.name}
    songs_name = Song.all.collect {|song| song.name}
    artists_from_artist_class = Artist.all.select {|artists| songs_name.include?(artists.name) == false}.collect {|artist| artist.name}
    all_artists = artists_from_song_class + artists_from_artist_class
    all_artists.uniq.sort.each_with_index {|name, idx| puts "#{idx + 1}. #{name}"}
  end

  def list_genres
    Song.all.collect {|song| song.genre.name}.uniq.sort.each_with_index {|genre, idx| puts "#{idx + 1}. #{genre}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp.downcase
    artists = Song.all.collect {|song| song.artist.name.downcase}
    if artists.include?(input)
      Song.all.select {|song| song.artist.name.downcase == input}.sort_by {|song| song.name}.each_with_index {|song, idx| puts "#{idx + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp.downcase
    genres = Song.all.collect {|song| song.genre.name.downcase}
    if genres.include?(input)
      Song.all.select {|song| song.genre.name.downcase == input}.sort_by {|song| song.genre.name}.each_with_index {|song, idx| puts "#{idx + 1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    songs_arr = Song.all.sort_by {|song| song.name}
    input = gets.chomp.to_i
    if input > 0 && input <= songs_arr.size
      song = songs_arr[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
