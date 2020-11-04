class Artist

  attr_accessor :name, :songs
  extend Concerns::Findable

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
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end


  def add_song(song)
    if song.artist == nil
      song.artist = self
      @songs << song
    end
    # song.artist = self unless song.artist
    # songs << song unless songs.include?(song)
  end

  def genres
    songs.collect { |song| song.genre }.uniq
  end

end
