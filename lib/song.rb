class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name,artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    Song.new(nil).tap do |song|
      artist,name,genre = file.split(" - ")
      genre.chomp!(".mp3")
      song.name = name
      song.artist = Artist.find_or_create_by_name(artist)
      song.genre = Genre.find_or_create_by_name(genre)
    end
  end

  def self.create_from_filename(file)
    song = new_from_filename(file)
    song.save
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
    Song.new(name).tap do |song|
      song.save
    end

  end


end
