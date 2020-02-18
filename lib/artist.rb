require_relative './concerns/Findable.rb'

class Artist
  attr_accessor :name, :songs, :genres
  @@all = []
  extend Concerns::Findable
  def initialize(name)
    @name = name
    @songs = []
    @genres = []
  end
  def self.all
    @@all
  end
  def save
    @@all << self
  end
  def self.destroy_all
    self.all.clear
  end
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
  def add_song(song)
    if !(song.artist)
      song.artist = self
      self.songs << song
      if(song.genre)
        self.genres << song.genre
      end
    end
  end
  def genres
    artist_genres = []
    songs = Song.all.select {|song| song.artist == self}
    songs.each do |song|
      artist_genres.push(song.genre)
    end
    artist_genres
    binding.pry
  end
end
