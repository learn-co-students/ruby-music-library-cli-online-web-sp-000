require 'pry'


class MusicLibraryController

  extend Concerns::Findable
  include Concerns::InstanceMethods
  extend Concerns

attr_accessor :importer

attr_accessor :importer

def initialize(path = './db/mp3s')
  @importer = MusicImporter.new(path)


importer.import
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

    response = gets.strip.downcase

    case response
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


    unless response == "exit"
      call
    end

  end



  def list_songs
      song_list = Song.all.sort_by{|song| song.name}
      song_list.each {|song|
      puts "#{(song_list.index(song) + 1)}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genres
    genre_list = Genre.list
    genre_list.each {|genre|
    puts "#{(genre_list.index(genre) + 1)}. #{genre}"}
  end

  def list_artists
    artist_list = Artist.list
    artist_list.each {|artist|
    puts "#{(artist_list.index(artist) + 1)}. #{artist}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    unless  Artist.find_by_name(input) == nil
    song_list = Song.all.select {|song| song.artist.name == input}
    song_list.sort_by!{|song| song.name}
    song_list.each {|song|
    puts "#{(song_list.index(song) + 1)}. #{song.name} - #{song.genre.name.chomp(".mp3")}"}
  end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    unless  Genre.find_by_name(input) == nil
    song_list = Song.all.select {|song| song.genre.name == input}
    song_list.sort_by!{|song| song.name}
    song_list.each {|song|
    puts "#{(song_list.index(song) + 1)}. #{song.artist.name} - #{song.name}"}
  end
end


  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    unless (input < 1) || (input > Song.count)
      chosen_song = Song.all.sort_by{|song| song.name}[input - 1]
      puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
    end
  end



end
