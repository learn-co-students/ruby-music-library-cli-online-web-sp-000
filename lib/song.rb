require 'pry'
require_relative '../lib/concerns/findable.rb'

class Song

  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
  end
end

  def self.all
    @@all
  end

  def save
    if !@@all.include?(self)
         @@all << self
       end
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Song.new(name).tap do |new_song|
    new_song.save
  end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    parsed_name = filename.split(' - ')
   song_name = parsed_name[1]
   artist_name = parsed_name[0]
   genre_name = parsed_name[2].gsub(".mp3","")
   Song.find_or_create_by_name(song_name).tap do |song|
   song.artist = Artist.find_or_create_by_name(artist_name)
   song.genre = Genre.find_or_create_by_name(genre_name)
 end
 end

 def self.create_from_filename(filename)
   self.new_from_filename(filename).tap{|song|song.save}
end

end
