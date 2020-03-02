class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre =  self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre = self unless song.genre #create new object unless it already exists
    songs << song unless songs.include?(song) #add object to songs array unless its already in array
  end

  def artists
    @artists = songs.collect{|song| song.artist}.uniq
  end

end
