#require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize (name, artist= nil, genre=nil)
    @name  = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).tap {|song|song.save}
  end

  def save
  self.class.all << self
  end


  def artist=(artist)
   @artist = artist
    artist.add_song(self)
  end


   def genre=(genre)
     @genre = genre
     genre.add_song(self) unless genre.songs.include?(self)
   end



  def self.destroy_all
    all.clear
  end

  def self.new_from_filename(name)
    artist, song, genre_filename = name.split(' - ')
    genre_no_filename = genre_filename.gsub('.mp3', '')
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre_no_filename)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end
end
