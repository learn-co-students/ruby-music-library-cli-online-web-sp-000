class Artist
  extend Concerns::Findable
  include Concerns::Findable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end

    if song.artist != self
      song.artist = self
    end
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end
end