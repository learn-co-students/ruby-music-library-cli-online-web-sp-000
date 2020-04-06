class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  # Assign the song's artist to this Artist (unless
  # that song already has an Artist) and include the song
  # in this Artist's @songs variable, unless it is already
  # present there.
  def add_song(song)
    song.set_artist(self) unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def self.create(name)
    Artist.new(name).tap {|artist| artist.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  # Collect all genres associated with this Artist
  def genres
    genres = []
    songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

end
