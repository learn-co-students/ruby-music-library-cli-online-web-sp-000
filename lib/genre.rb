class Genre
  extend Concerns::Findable

  @@all =[]
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
