class Artist

  attr_accessor :name, :songs
  attr_reader :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.create(artist)
    newartist = self.new(artist)
  end

  def add_song(song)
   song.artist = self unless song.artist
   songs.push song unless songs.include?(song)
  end

  def genres
    songs.collect do |song|
      song.genre
    end.uniq
  end

end
