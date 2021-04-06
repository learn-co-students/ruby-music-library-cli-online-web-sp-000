require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist

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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

# rspec spec/005_songs_and_genres_spec.rb
  def songs
    Song.all.select {|song| song.genre == self}
  end

# rspec spec/006_artists_and_genres_spec.rb
  def artists
    artist_array = Song.all.collect {|song| song.artist}
    artist_array.uniq
  end

end
# rspec spec/003_genre_basics_spec.rb
