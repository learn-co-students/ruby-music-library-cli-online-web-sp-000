require 'pry'

class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    Song.all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create(name)
    end
  end
end