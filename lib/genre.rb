class Genre 
  attr_accessor :name 
  extend Concerns::Findable
  
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
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def songs 
    @songs
  end
  
  def artists
    @artists_arr = []
    
    @songs.each do |song|
      if @artists_arr.include?(song.artist)
        nil
      else
        @artists_arr << song.artist
      end
      
    end
    @artists_arr
  end
  
  
end