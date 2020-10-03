require 'pry'
class Song
    attr_accessor :name
    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
    self.save
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self) if self.artist
    end
  end

  def artist
    @artist
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      genre.add_song(self) if self.genre
    end
  end

  def genre
    @genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Song.new(name)
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

  def self.new_from_filename(file)
    # binding.pry
    split_file = file.split(" - ")
    song = self.new(split_file[1])
    artist = Artist.find_or_create_by_name(split_file[0])
    genre = Genre.find_or_create_by_name(split_file[2].split(".")[0])
    song.genre = genre
    song.artist = artist
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end
end
