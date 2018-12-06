class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genre
  @@all=[]
  def initialize(name)
    @name = name
    @songs=[]
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
    self.new(name).tap do |artist|
      artist.save
    end
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    @songs.collect do |song|
      song.genre
    end
    .uniq
  end

end
