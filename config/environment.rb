require 'pry'
require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'

class Song

  attr_accessor :name
  attr_reader :genre

  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.sorted
    self.all.uniq.sort_by {|s| s.name}
  end

  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end

  def artist
    @artist
  end

  def genre=(genre)
    if @genre == nil
      @genre = genre
    else
      @genre= @genre
    end
    if self.genre != nil
      @genre.add_song(self)
    end
    @genre
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.create_from_filename(name)
    @@all << self.new_from_filename(name)

  end

  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

end


class Artist
  attr_accessor :name

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = @songs.collect {|song| song.genre}
    genres.uniq
  end

end


class Genre
  attr_accessor :name

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    artists = @songs.collect {|song| song.artist}
    artists.uniq
  end

end


class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files()
    @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  end

  def import()
    files.each {|filename| Song.create_from_filename(filename)}
  end

end


class MusicLibraryController

  extend Concerns::Findable

  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
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
    songs_sorted_by_name = Song.sorted
    songs_sorted_by_name.uniq.each.with_index {|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    songs_sorted_by_artist = Artist.all.sort_by {|artist| artist.name}
    songs_sorted_by_artist.each.with_index(1) {|artist,index| puts "#{index}. #{artist.name}"}
  end

  def list_genres
    songs_sorted_by_genre = Genre.all.sort_by {|genre| genre.name}
    songs_sorted_by_genre.each.with_index(1) {|genre,index| puts "#{index}. #{genre.name}"}
  end


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      songs_sorted_by_name = artist.songs.sort_by {|song| song.name}
      songs_sorted_by_name.each.with_index(1) {|song,index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      songs_sorted_by_name = genre.songs.sort_by {|song| song.name}
      songs_sorted_by_name.each.with_index(1) {|song,index| puts "#{index}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
   puts "Which song number would you like to play?"
   input = gets.strip.to_i
   if input.between?(1, Song.all.length) && Song.sorted[input]!= nil
     song = Song.sorted[input-1]
     puts "Playing #{song.name} by #{song.artist.name}"
   end
  end

end
