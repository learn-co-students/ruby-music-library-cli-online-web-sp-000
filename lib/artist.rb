class Artist
  extend Concerns::Findable
  attr_accessor :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def add_song(song)
    song.artist=(self) if song.artist == nil
    self.songs << song unless self.songs.include?(song)
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

  def self.create(artist)
    instance = Artist.new(artist).tap do |i|
      i.name = artist
      i.save
    end
  end

end
