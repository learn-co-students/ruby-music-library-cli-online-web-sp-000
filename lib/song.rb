class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.save_song(self)
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
    created_song = self.new(name)
    created_song.save
    created_song
  end

  def artist
    return @artist
  end

  def genre
    return @genre
  end

  def self.new_from_filename(filename)
    filename = filename.delete_suffix('.mp3')
    song = self.find_or_create_by_name(filename.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2])
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
