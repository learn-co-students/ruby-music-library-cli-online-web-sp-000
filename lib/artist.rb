require 'pry'
require_relative '../lib/concerns/findable'

class Artist 
  extend Concerns::Findable 
  
  attr_accessor :name, :songs 
  
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
    artist = new(name)
    artist.save
    artist
  end 
  def add_song(song) 
    song.artist = self if song.artist.nil?
    songs << song if !songs.include?(song)
  end 
  def genres 
    results = [] 
    songs.each do |s|
      results << s.genre unless results.include?(s.genre)
    end 
    results
  end 
end 

