require 'pry'
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
    created_artist = self.new(name)
    created_artist.save
    created_artist
  end
  
  def add_song(song)
    if song.artist
    else song.artist = self
    end
    if @songs.include?(song)
    else @songs << song
    end
  end
  
  def genres
    genres_array = []
    songs.each do |song|
      genres_array << song.genre if !genres_array.include?(song.genre)
      
      # if genres_array.include?(song.genre)
      # else genres_array << song.genre
      # end
      # binding.pry
    end
    genres_array
  end
  
  def self.find_by_name(artist_name)
    self.all.find do |artist|
      artist.name == artist_name
    end
  end
  
end