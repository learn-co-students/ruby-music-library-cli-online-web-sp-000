class Genre
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def add_song(song)
      @songs << song
  end

  def artists
    self.songs.collect{|x| x.artist}.uniq
  end

end
