class Artist

  attr_accessor :name, :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(artist)
    artist = self.new(artist)
    @@all << artist
    artist
  end

  # assigns the current artist to the song's 'artist' property (song belongs to artist)
  # if the song already has an artist, don't assign an artist
  # adds the song to the current artist's 'songs' collection
  # does not add the song to the current artist's collection of songs if it already exists therein
  # self = #<Artist:0x0000000001f95618 @name="Neutral Milk Hotel", @songs=[]>
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  # returns a collection of genres for all of the artist's songs (artist has many genres through songs)
  # does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
  # collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
  def genres
    @genre_array = []
    @songs.each do |song|
      if @genre_array.include?(song.genre)
        nil
      else
        @genre_array << song.genre
      end
    end
    @genre_array
  end

end
