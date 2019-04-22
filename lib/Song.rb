require_relative './concerns/findable.rb'
class Song
extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist
  @@all=[]

  def initialize(name, artist=artist,genre=genre)
    @name=name
    self.artist=(artist) if artist.class==Artist
    self.genre=(genre) if genre.class==Genre
  end


  def self.all
     @@all
  end

  def self.destroy_all
      @@all.clear
  end

  def save
    self.class.all<<self
  end

  def self.create(name)
    song=Song.new(name)
    song.save
    song
  end

def artist=(artist)
  @artist=artist
  artist.add_song(self)
end

def genre=(genre)
  @genre=genre
  if self.artist && !self.artist.genres.include?(genre)
    self.artist.genres<<genre
  end
  if self.genre && !(genre.songs.include?(self))
   genre.songs<<self
end
end





end
