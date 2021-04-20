require 'pry'
#require_relative './song'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre
  @@all=[]
  
  def initialize(name)
    @name=name
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Artist.new(name).tap {|artist| artist.save}
  end
  
  def songs
    @songs=[]
    Song.all.each {|song| @songs << song if song.artist==self && !@songs.include?(song)}
    @songs
  end
  
  def genres
    genre_array=[]
    self.songs.each {|song| genre_array << song.genre if !genre_array.include?(song.genre)}
    genre_array
  end
  
  def add_song(song)
    song.artist=self if song.artist != self
    @songs << song if !self.songs.include?(song)
  end
end