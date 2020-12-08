class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.genre == nil
      song.genre = self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    @name = name
    genre.save
    genre
  end


end
