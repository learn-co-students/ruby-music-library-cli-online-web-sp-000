class Artist
  
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
  
  def add_song(song_oi)
    song_oi.artist = self if !(song_oi.artist)
    @songs << song_oi if !(@songs.include?(song_oi))
  end

  def genres
    genre_oiArray = []
    self.songs.each do |i|
      genre_oiArray << i.genre unless genre_oiArray.include?(i.genre)
    end
    genre_oiArray
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
    newArtist_oi = self.new(name)
    newArtist_oi
  end
  
  
end

# rspec spec/002_artist_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb
# rspec spec/006_artists_and_genres_spec.rb