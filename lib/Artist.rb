require "pry"

class Artist
  attr_accessor :name
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    
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

  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end 


  def add_song(song)
   #binding.pry
   song.artist = self unless song.artist 
  end
  
   def songs
    Song.all.select do |song|
      song.artist == self
      #binding.pry
  end
    
  
  end

  def genres
    @new_array = []
    songs.each do |song|
      if @new_array.include?(song.genre)
        nil
      else
        @new_array << song.genre
      end
    end
    @new_array
  end

end