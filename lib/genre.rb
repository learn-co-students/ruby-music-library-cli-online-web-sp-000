class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      if !artists_array.include?(song.artist)
        artists_array << song.artist
      end
    end
    artists_array
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
