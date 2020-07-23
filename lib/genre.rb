require 'pry'
require_relative '../lib/concerns/findable'

class Genre 
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
    genre = new(name) 
    genre.save  
    genre 
  end 
  def artists 
    results = []
    songs.each do |s|
      results << s.artist unless results.include?(s.artist)
    end 
    results
  end 
end 