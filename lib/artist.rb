class Artist
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
    #binding.pry
    if song.artist == nil
      song.artist = self
      if not @songs.include?(song)
        @songs << song
      end
    end
  end

end
