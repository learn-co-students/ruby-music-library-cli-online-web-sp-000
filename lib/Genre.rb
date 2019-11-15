require 'pry'

class Genre

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    #self.artists = []
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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end


  def artists
    artist_list = []
    @songs.each do |song|
      if !artist_list.include?(song.artist)
        artist_list << song.artist
      end
    end
    artist_list
  end

end
