class Genre 

  attr_accessor :name, :songs

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
    Genre.all.clear 
  end 

  def save
    @@all << @genre 
  end 

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def artists 
    songs.map {|song| song.artist}.uniq
  end 

end 