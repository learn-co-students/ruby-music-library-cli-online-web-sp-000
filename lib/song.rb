class Song
  attr_accessor :name, :genre, :artist
  #attr_reader :artist#, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist
    self.genre = genre
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

  def artist=(artist)
    if artist
      @artist = artist
      artist.add_song(self)
    end

  end

  def genre=(genre)
    if genre
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      Song.create(name)
    end
  end

  def self.new_from_filename(filename)
    filename = filename[0..-5]
    filename_info = filename.split(" - ")
    name = filename_info[1]
    artist = Artist.find_or_create_by_name(filename_info[0])
    genre = Genre.find_or_create_by_name(filename_info[2])

    if self.find_by_name(name)
      self.find_by_name(name)
    else
      Song.new(name, artist, genre)
    end

  end

  def self.create_from_filename(filename)
    created_song = self.new_from_filename(filename)
    created_song.save
    created_song
  end

end
