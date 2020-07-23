class Genre
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

  def artists
    songs.map {|song| song.artist}.uniq
  end
end