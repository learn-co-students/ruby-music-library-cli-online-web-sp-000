require 'pry'

class Genre

  extend Concerns::Findable

  attr_accessor :name

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
    new_object = Genre.new(name)
    new_object.save
    new_object
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
