class Artist

  attr_accessor :name, :songs
  attr_reader :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(artist)
    newartist = self.new(artist)
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if !@songs.include?(song)
      @songs << song
    end
  end

  def genre
    @songs.map do |song|
      song.genre
  end
end
end
