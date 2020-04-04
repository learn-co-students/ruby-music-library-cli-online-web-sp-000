class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []


  #Hook
  def initialize(name)
    @name = name
    @songs = []
  end

  #Class methods

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  #Instance methods

  def save
    self.class.all << self
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect {|inst| inst.genre}.uniq
  end

end
