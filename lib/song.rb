require 'pry'
class Song

  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist unless artist==nil
    self.genre = genre unless genre==nil
  end

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end

  def genre=(name)
    @genre = name
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(new_song)
    var = Song.new(new_song)
    var.save
    var
  end

  def artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end

  def genre_name=(name)
    @genre = Genre.find_or_create_by_name(name)
  end

  def self.new_from_filename(x)
    song = self.new(x.split(" - ")[1])
    song.artist_name=(x.split(" - ")[0])
    song.genre_name=(x.split(" - ")[2].gsub(/\.\w+/, ''))
    song
  end

  def self.create_from_filename(x)
    self.new_from_filename(x).save
  end



end
