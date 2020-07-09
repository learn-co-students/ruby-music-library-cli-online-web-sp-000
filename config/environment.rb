require 'bundler'
Bundler.require

module Concerns
  module Findable
     def find_by_name(name)
      all.select do |song|
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
    self.new(name).save
    self
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
    self.all.select do |song|
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
    self.new(name).save
    self
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
    self.new(name).save
    self
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
    
  
  
  
end
