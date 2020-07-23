class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      if song.artist.nil?
        song.artist = self
      end
    end
  end

  def genres
    @songs.collect {|s| s.genre}.uniq
  end

end

