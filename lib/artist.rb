require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

# rspec spec/004_songs_and_artists_spec.rb
  def add_song(song)
     if (song.artist.nil?) #on song arg given, call Artist class method artist and check if nil
       song.artist= self # if nil, set artist = self as we are an instance of Artist here
     end
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

# rspec spec/006_artists_and_genres_spec.rb
  def genres
    genre_array = Song.all.collect {|song| song.genre}
    genre_array.uniq
  end

end
# rspec spec/002_artist_basics_spec.rb
