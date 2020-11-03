class Artist

  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

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
    if song.artist == nil
      song.artist = self
    end

    unless @songs.include?(song)
      @songs << song
    end
  end

  def genres
    genre = @songs.collect {|e| e.genre}
    array = genre.uniq
    array
  end

end
