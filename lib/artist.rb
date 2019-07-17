class Artist
  extend Concerns::Findable                #Artist extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []             #Associations creates songs property to empty array (artist has many songs)
  end

  def self.all
    return @@all
  end

  def self.destroy_all
    return @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = new(name)      #initializes (creates) artist
    artist.save             #saves the artist
    return artist
    #new(name).tap{ |a| a.save }
  end

  def songs
    return @songs               #returns artist songs collection (artist has many songs)
  end

  def add_song(song)              #assigns the current artist to the song's 'artist' property (song belongs to artist)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end

  def genres                            #returns a collection of genres for all of the artist's songs
    songs.collect {|song| song.genre}.uniq    #artits has many genres through songs
  end
end
