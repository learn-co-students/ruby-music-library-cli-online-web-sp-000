require "pry"
require_all 'lib'

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
    Artist.new(name).save
    Artist.all.last
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
      if self.songs.any? {|songs| songs == song} == false
        self.songs << song
      end
  end
  
  def genres
    songs.map {|songs| songs.genre}.uniq
  end
    
  
# binding.pry  
  
end

# genre = Genre.new("indie rock")
# other_genre = Genre.new("electro pop")
# artist = Artist.new("The Magnetic Fields")
# other_artist = Artist.new("Neutral Milk Hotel")























# require "pry"

# class Artist
  
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
#     Artist.new(name).save
#     self
#   end

#   def songs
#     @songs
#   end
  
#   def add_song(song)
#     if song.artist == nil
#       song.artist = self
#   end
#     if @songs.any? {|songs| songs == song} == false
#       @songs << song
#     end
#   end

#   def genres
#     songs.collect{|song| song.genre}.uniq
#   end
    
# binding.pry

# end


