class Artist
  extend Concerns::Findable
  extend Concerns::Trackable::ClassMethods
  include Concerns::HasManySongs
  include Concerns::Trackable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    super(song, "artist")
  end

  def genres
    through_songs_has_many(:genre)
  end
end
