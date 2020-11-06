class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def save
    @@all << self
  end
  def self.destroy_all
    @@all = []
  end
  def self.create(name)
    song = Artist.new(name).tap do |s|
      s.save
    end
  end
  def songs
    # Songs.all.collect{|s| s.artist == self}
    @songs
  end
  def add_song(song)
    if song.artist.class != Artist
      song.artist = self
    end
    if @songs.detect{|s| s == song} == nil
      @songs << song
    end
  end
  def genres
    genre_array = []
    self.songs.each{|s| genre_array << s.genre if !genre_array.include?(s.genre)}
    genre_array
  end
end
