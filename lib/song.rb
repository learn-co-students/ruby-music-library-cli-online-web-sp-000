class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name,artist = nil,genre = nil)
    @name = name
    #@artist = artist
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    #@genre = genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)

  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end



end
