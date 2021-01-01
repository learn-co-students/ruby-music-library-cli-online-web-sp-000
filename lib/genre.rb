require 'pry'
require_relative "../lib/findable.rb"

class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def genres
    self.song.genre
  end
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end
  
  def songs
    @songs
  end
  
  def name
    @name
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
end