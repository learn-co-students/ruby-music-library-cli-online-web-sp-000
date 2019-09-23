
class Genre
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  #   Song.all.select do |song|
  #     song.genre == self
  #   end
  end

  def add_song(song)
      song.genre = self unless song.genre
      songs << song unless songs.include?(song)
  end

  def artists
    songs.map{|x| x.artist}.uniq
  end

end
