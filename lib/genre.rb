class Genre
  extend Memorable::ClassMethods, Concerns::Findable
  include Memorable::InstanceMethods

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
    @songs << song if !@songs.include?(song)
    artist = song.artist
    #artist.add_genre(self) if artist != nil
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end
