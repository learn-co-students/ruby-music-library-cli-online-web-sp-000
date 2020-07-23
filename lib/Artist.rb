class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist # Checks to see if our song already has an artist.
    songs << song unless songs.include?(song) # Checks to see if our songs array already includes the song we entered.
  end

  def genres
    songs.collect {|song_name| song_name.genre}.uniq # We utilize collect to return an array
  end

end
