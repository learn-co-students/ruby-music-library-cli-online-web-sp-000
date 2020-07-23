class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist= (artist)
    @artist = artist
    if @artist
      artist.add_song(self)
    end
  end

  def genre= (genre)
    @genre = genre
    if @genre && !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    file_stats = filename.split(" - ")
    artist = file_stats[0]
    title = file_stats[1]
    genre = file_stats[2].sub(".mp3","")

    song = Song.find_or_create_by_name(title)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)

    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
