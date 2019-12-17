class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil )
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
    song = Song.new(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    song = Song.new(file)
    split_file = file.split(" - ")
    song.name = split_file[1]
    artist = split_file[0]
    genre = split_file[2].chomp(".mp3")
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(file)
    song = new_from_filename(file)
    @@all << song
  end




end
