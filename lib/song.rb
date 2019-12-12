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

  def self.new_from_filename(filename)
    song = Song.new(filename)
    song.name = filename.split(" - ")[1]
    #title = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre = filename.split(" - ")[2].chomp(".mp3")
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song

  end



end
