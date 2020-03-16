class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist.class == Artist
      self.artist = artist
    end

    if genre.class == Genre
      self.genre = genre
    end

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
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  # def self.find_by_name(name)
  #   @@all.detect {|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if Song.find_by_name(name)
  #     Song.find_by_name(name)
  #   else
  #     Song.create(name)
  #   end
  # end

  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    song_name = filename_array[1]
    artist_name = filename_array[0]
    genre_name = filename_array[2].split(".")[0]
    artist_object = Artist.find_or_create_by_name(artist_name)
    genre_object = Genre.find_or_create_by_name(genre_name)
    song = self.find_or_create_by_name(song_name)
    song.artist = artist_object
    song.genre = genre_object
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end


end
