require "pry"

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
    Genre.new(name).save
    Genre.all.last
  end
  
  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
      if self.songs.any? {|songs| songs == song} == false
        self.songs << song
    end
  end
  
  def artists
    songs.map {|songs| songs.artist}.uniq
  end
    
    
# binding.pry

end






























# class Genre
  
#   extend Concerns::Findable
  
#   attr_accessor :name, :songs
  
#   @@all = []
  
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
  
#   def self.all
#     @@all
#   end
  
#   def save
#     @@all << self
#   end
  
#   def self.destroy_all
#     @@all.clear
#   end
  
#   def self.create(name)
#     Genre.new(name).save
#     self
#   end

#   def songs
#     @songs
#   end
  
#   def add_song(song)
#     if song.genre == nil
#     song.genre = self
#   end
#     if @songs.any? {|songs| songs == song} == false
#     @songs << song
#   end
# end

# def artists
#   songs.map {|songs| songs.artist}.uniq
# end
  
    
# # binding.pry

# end

