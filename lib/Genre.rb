require_relative './Concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  def add_song(song)
    if song.genre != self
      song.genre = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
  def artists
    self.songs.collect {|item| item.artist}.uniq
  end

end
