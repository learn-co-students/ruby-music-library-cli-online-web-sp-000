# learn spec/002_artist_basics_spec.rb
# learn spec/004_songs_and_artists_spec.rb
# learn spec/006_artists_and_genres_spec.rb
class Artist 
  extend Concerns::Findable
  attr_accessor :name
  attr_accessor :songs
  
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
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    songs.collect{ |s| s.genre }.uniq
  end
end 
