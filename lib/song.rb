class Song

  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end

    if genre
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    unless self.genre
      @genre = genre
    end

    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    my_song = filename.split(" - ")[1]
    my_artist = filename.split(" - ")[0]
    my_genre = filename.split(" - ")[2].gsub(".mp3", "")
    song_artist = Artist.find_or_create_by_name(my_artist)
    song_genre = Genre.find_or_create_by_name(my_genre)
    song = self.new(my_song, song_artist, song_genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
