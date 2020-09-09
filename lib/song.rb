require_relative "./concerns/findable.rb"

class Song
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.all
    @@all
  end
  
  def self.all_by_artist_name(name)
    self.all.select {|song| song.artist.name == name}
  end
  
  def self.all_by_genre_name(name)
    self.all.select {|song| song.genre.name == name}
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    self.new(name).tap {|item| item.save}
  end
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = Song.new(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.genre = Genre.find_or_create_by_name(data[2].split(".")[0])
    song
  end
  
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song
    new_song
  end
  
end