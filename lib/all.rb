require 'pry'


class Artist
  
  
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if @songs.include?(song) == false
  end
  
  def songs
    @songs
  end

  def genres
    genres = []
    artists_songs = Song.all.select{|song| song.artist == self}
    artists_songs.map{|song| genres << song.genre if genres.include?(song.genre) == false}
    genres
  end
  
end

require 'pry'


class Genre
  
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  
  def add_songs
    genres_songs = Song.all.select{|song| song.genre == self}
    genres_songs.map {|song| @songs << song if @songs.include?(song) == false}
  end
  
  def songs
    add_songs
    @songs
  end
  
  def add_artists
    genres_artists = Song.all.select{|song| song.genre == self}
    @artists = []
    genres_artists.map {|song| @artists << song.artist if @artists.include?(song.artist) == false}
  end
  
  def artists
    add_artists
    @artists
  end
  
end

require 'pry'


class Song
  
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    @artist = artist
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    Song.all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create(name)
    end
  end
  
  def genre=(genre)
    @genre = genre
    save
    @genre
  end 
  
  def genre
    @genre
  end
  
  def artist=(artist)
    @artist = artist
    save
    @artist.add_song(self)
    @artist
  end
  
  def artist
    @artist
  end
  
  
end