class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    if artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    # binding.pry
    if genre
      genre.add_song(self)
    end
  end

  def self.new_from_filename(file)
    file_split_array = file.split(" - ")
    artist = Artist.find_or_create_by_name(file_split_array[0])
    genre = Genre.find_or_create_by_name(file_split_array[2].chomp('.mp3'))
    song = Song.new(file_split_array[1], artist, genre)
    song
    # binding.pry
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  # def self.find_by_name(name)
  #   self.all.detect do |song|
  #     song.name == name
  #   end
  # end

  # def self.find_or_create_by_name(name)
  #   song_exists = self.find_by_name(name)
  #   song_exists ? song_exists : self.create(name)
  # end
end