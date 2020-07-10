require 'pry'


class MusicLibraryController

  extend Concerns::Findable
  include Concerns::InstanceMethods
  extend Concerns

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
    # genre_list = Genre.all.map {|genre| genre.name}
    # genre_list.sort!.each {|genre|
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
    puts "#{(song_list.index(song) + 1)}. #{song.name} - #{song.genre.name}"}
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

  end



end
