class Genre
  
  extend Concerns::Findable
  
  @@all = []
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def songs
    @songs
  end
  
  def artists
    artist_oiArray = []
    self.songs.each do |i|
      artist_oiArray << i.artist unless artist_oiArray.include?(i.artist)
    end
    artist_oiArray
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    newGenre_oi = self.new(name)
    newGenre_oi
  end
  
end


# rspec spec/003_genre_basics_spec.rb
# rspec spec/005_songs_and_genres_spec.rb