class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist

    # Or, as a one-liner:
    # new(name).tap{ |a| a.save }
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end
end










# class Artist
#   extend Concerns::Findable
#   attr_accessor :name
#   attr_reader :songs #artist has many songs
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @songs = [] #artist has many songs
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def save
#     @@all << Artist.new(name)
#   end
#
#   def self.create(name)
#     new_artist = Artist.new(name)
#     new_artist.save
#     new_artist
#   end
#
#   def add_song(song_name) #song belongs to artist
#     song_name.artist = self unless song_name.artist
#     songs << song_name unless songs.include?(song_name)
#   end
#
#   def genres #artist has many genres through songs
#     all = []
#     songs.collect do |song|
#       all << song.genre
#     end
#     all.uniq
#   end
#
# end
