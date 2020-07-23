class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.nil?
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.nil? || genre.songs.include?(self)
  end
  
  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    
    artist = Artist.find_or_create_by_name(split[0])
    song = Song.find_or_create_by_name(split[1])
    genre = Genre.find_or_create_by_name(split[2].chomp(".mp3"))

    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
  end

#  def self.find_by_name(name)
#    @@all.detect{|song| song.name == name}
#  end
#
#  def self.find_or_create_by_name(name)
#    song = self.find_by_name(name)
#    if song.nil?
#      song = Song.create(name)
#    end
#    song
#  end
end

