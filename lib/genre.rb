class Genre

  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name, :song, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def artists
    artist = @songs.collect {|e| e.artist}
    array = artist.uniq
    array
  end

end
