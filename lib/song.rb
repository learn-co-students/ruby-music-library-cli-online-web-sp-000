class Song
  extend Concerns::Findable
  include Concerns::Nameable
  include Concerns::Instance_all
  extend Concerns::Class_all
  attr_reader :name, :artist, :genre
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  # def name
  #   @name
  # end
  #
  # def name=(name)
  #   @name = name
  # end

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

  # def self.destroy_all
  #   @@all.clear
  # end
  #
  # def save
  #   @@all << self
  # end
  #
  # def self.create(song)
  #   instance = Song.new(song).tap do |i|
  #     i.name = song
  #     i.save
  #   end
  # end

  def self.new_from_filename(file)
    artist_s, song_s, genre_mp3 = file.split(" - ")
    genre_s, type_s = genre_mp3.split(".")
    Song.new(song_s, Artist.find_or_create_by_name(artist_s), Genre.find_or_create_by_name(genre_s))
  end

  def self.create_from_filename(file)
    imported_song = self.new_from_filename(file).tap do |i|
      i.save unless self.all.include?(i)
    end
  end
end
