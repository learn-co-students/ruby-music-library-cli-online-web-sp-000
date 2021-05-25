class Genre

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    save
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
    song = Genre.new(name)
  end

  def songs
    Song.all.filter {|song| song.genre == self}
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end

end