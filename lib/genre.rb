class Genre 
  
  extend Concerns::Findable

  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save 
    genre
  end
  
  def songs 
    @songs 
  end
  
  def artists 
    @arr = []
    @songs.each do |song| 
      if @arr.include?(song.artist) 
        nil 
      else 
        @arr << song.artist 
      end 
    end
    @arr
  end
end