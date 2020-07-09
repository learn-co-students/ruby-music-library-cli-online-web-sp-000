require 'bundler'
Bundler.require
require 'pry'

module Concerns
  module Findable
     def find_by_name(name)
      all.detect do |song|
        song.name == name
      end
    end
  
    def find_or_create_by_name(name)
      if find_by_name(name) == nil
        create(name)
      else
        find_by_name(name)
      end
    end
  end
  
end

require_all 'lib'

class Song
  
  attr_accessor :name, :genre, :artist
  
  @@all = []
  
  def initialize(name, artist = "", genre = "")
    @name = name
    self.artist = artist
    self.genre = genre
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    obj = self.new(name)
    obj.save
    obj
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def artist=(artist)
      if artist != ""
        @artist = artist
        artist.add_song(self)
      else
        @artist = ""
      end
  end
  
  def genre=(genre)
    if genre != ""
      @genre = genre
        if genre.songs.include?(self) == false
          genre.songs << self 
        end
    else
      @genre = ""
    end
  end
  
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    new_song = filename.split(" - ")
    new_song[2].slice! ".mp3"
    artist = Artist.find_or_create_by_name(new_song[0])
    genre = Genre.find_or_create_by_name(new_song[2])
    song = self.new(new_song[1], artist, genre)
  end
  
  def self.create_from_filename(filename)
    obj = self.new_from_filename(filename)
    @@all << obj
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
  
  def save
    @@all << self
  end
  
  def self.create(name)
    obj = self.new(name)
    obj.save
    obj
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist == ""
      song.artist = self
    elsif @songs.include?(song) == false
      @songs << song
    end
  end
  
  def genres
    genres = self.songs.map do |song|
      song.genre
    end
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
  
  def save
    @@all << self
  end
  
  def self.create(name)
    obj = self.new(name)
    obj.save
    obj
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def songs
    @songs
  end
  
  def artists
    artists = self.songs.map do |song|
      song.artist
    end
    artists.uniq
  end
    

  
end

class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Dir.children(@path)
  end
  
  def import
    files.each do |song|
      Song.create_from_filename(song)
    end
  end
end


class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
      obj = MusicImporter.new(path)
      @songs = obj.import
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
      input = ""
      until input == "exit"
        input = gets.chomp
        if input == 'list songs'
          list_songs
        elsif input == 'list artists'
          list_artists
        elsif input == 'list genres'
          list_genres
        elsif input == 'list artist'
          list_songs_by_artist
        elsif input == 'list genre'
          list_songs_by_genre
        elsif input == 'play song'
          play_song
        end
      end
    
  end
  
  def list_songs
    num = 1
    sorted = Song.all.sort_by {|song| song.name}
    sorted.each do |song|
      puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      num += 1
    end
  end
  
  def list_artists
    num = 1
    sorted = Artist.all.sort_by {|artist| artist.name}
    sorted.each do |artist|
      puts "#{num}. #{artist.name}"
      num += 1
    end
  end
  
  def list_genres
    num = 1
    sorted = Genre.all.sort_by {|genre| genre.name}
    sorted.each do |genre|
      puts "#{num}. #{genre.name}"
      num += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    num = 1
    input = gets.chomp
    if Artist.find_by_name(input) != nil
      artist = Artist.find_by_name(input)
      sorted = artist.songs.sort_by {|song| song.name}
        sorted.each do |song|
        puts "#{num}. #{song.name} - #{song.genre.name}"
        num += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    num = 1
    input = gets.chomp
    if Genre.find_by_name(input) != nil
      genre = Genre.find_by_name(input)
      sorted = genre.songs.sort_by {|song| song.name}
        sorted.each do |song|
        puts "#{num}. #{song.artist.name} - #{song.name}"
        num += 1
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    songs = Song.all.sort_by {|song| song.name}
    input = gets
    input_new = input.to_i
    if input_new.between?(1, input_new)
      input_new -= 1
      selected_song = songs[input_new]
      if selected_song != nil
        puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
      end
    end
  end
end
