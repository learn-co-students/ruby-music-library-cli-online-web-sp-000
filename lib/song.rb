class Song
  extend Concerns::Findable
  include Concerns::Findable::InstanceMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre != nil && !genre.songs.include?(self)
      @genre = genre
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    file = File.basename(filename, ".*")
    artist_name, song_name, genre_name = file.split(" - ")

    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end