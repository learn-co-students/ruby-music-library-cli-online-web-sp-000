require 'pry'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def save
    @@all << self
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      artists_array << song.artist unless artists_array.include?(song.artist)
    end
    artists_array
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end