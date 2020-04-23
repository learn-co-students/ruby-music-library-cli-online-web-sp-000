class Artist

  attr_accessor :name, :songs

  @@all = []
  include Concerns::Methods::InstanceMethods
  extend Concerns::Methods::ClassMethods,  Concerns::Findable

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    all_songs = self.songs
    all_genres = all_songs.collect {|x| x.genre}
    all_genres.uniq
  end

end
