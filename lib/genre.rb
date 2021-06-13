class Genre 
  extend Concerns::Findable
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    Genre.new(name)
  end 
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end 
  
  def songs 
    Song.all.select do |song|
      song.genre == self 
    end 
  end 
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end 
end 