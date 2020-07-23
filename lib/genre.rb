class Genre
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save << self
  end

  def self.all
    @@all
  end

  # def save
  #   self.class.all
  # end

  def self.destroy_all
    @@all.clear
  end

  def artists
    genre_artists = @songs.collect { |song| song.artist }
    genre_artists.uniq 
  end

  

end