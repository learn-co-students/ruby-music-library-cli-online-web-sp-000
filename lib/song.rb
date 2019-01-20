require 'pry'
class Song
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end 
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
  
  def self.new_from_filename(filename)
    artist_name, name, genre_name = filename.split(/ [-] |[.]/)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.all 
    @@all
  end
  
  def self.list_all
    all_sorted_by_name.each.with_index(1) do 
      |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end 
  
end