class Genre
  attr_accessor :name, :songs
  @@all = []
  include Concerns::Methods::InstanceMethods
  extend Concerns::Methods::ClassMethods,  Concerns::Findable

  def self.all
    @@all
  end

  def initialize(name, song = nil)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def artists
    all_songs = self.songs
    all_artists = all_songs.collect {|x| x.artist}
    all_artists.uniq
  end



end
