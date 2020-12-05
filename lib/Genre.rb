class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []
  @songs

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    #result_genre =  @@all.find do |genre| genre.name == self.name
    #end
    #if result_genre != null
      @@all << self
    #nd
  end
  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    artists = []
    self.songs.each do |song|
      if !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end
end
