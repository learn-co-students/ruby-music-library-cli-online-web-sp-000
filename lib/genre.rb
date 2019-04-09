require_relative 'concerns/findable.rb'

class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :artists
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
    genre = self.new(name)
    @@all << genre
    genre
  end
  
  #finds artists of specific genre through genres songs
  def artists
    no_dup = []
    @songs.each {|song| no_dup << song.artist if !no_dup.include?(song.artist)}
    #iterates through songs and adds to no_dup if that specific artist doesn't exist
    no_dup
    
  end
end