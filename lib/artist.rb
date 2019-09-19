require 'pry'
require_relative "../lib/findable.rb"

class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  
  def add_song(song)
    unless song.artist == self
      song.artist = self
    end
    
    unless @songs.include?(song)
      @songs << song
    end
  end
  
  def songs
    @songs
  end
  
  def genres
    songs.collect {|song| song.genre}.uniq
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
    self.new(name).tap {|artist| artist.save}
  end
end