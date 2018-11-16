require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    self.all << song
    song
  end

 def artist=(artist)
   @artist = artist
   artist.add_song(self)
   #binding.pry
  end

 def genre=(genre)
   @genre = genre
   genre.songs << self unless genre.songs.include?(self)
 end

 def self.find_by_name(name)
   self.all.detect {|song| song.name == name}
 end

 def self.find_or_create_by_name(name)
   self.find_by_name(name) ? self.find_by_name(name) : Song.create(name)
 end

 def self.new_from_filename(file)
   song_file = File.basename(file, File.extname(file)).split(" - ")
   song = Song.find_or_create_by_name(song_file[1])
   song.artist = Artist.find_or_create_by_name(song_file.first)
   song.genre = Genre.find_or_create_by_name(song_file.last)
   song
 end

 def self.create_from_filename(file)
  self.new_from_filename(file)
 end


end
