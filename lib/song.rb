require 'pry'
class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name, :genre, :artist
  @@all = []
  def initialize (name, artist_name = nil, genre_type = nil)
    @name = name
    if artist_name != nil
      self.artist = artist_name
    end
    if genre_type !=nil
      self.genre = genre_type
    end
  end

  def self.all
    @@all
  end

  def artist=(artist_name)
    @artist = artist_name
    artist_name.add_song(self)
  end

  def genre=(genre_type)
    @genre = genre_type
    if !(genre_type.songs.include?(self))
      genre_type.songs << self
    end
  end
  def self.find_by_name(song)
    @@all.detect{|obj| obj.name == song}
  end
  def self.find_or_create_by_name(song)
    if !(find_by_name(song)==nil)
      find_by_name(song)
    else
      self.create(song)
    end
  end
  def self.new_from_filename(filename)
    file_array = filename.split(/ - |[\.]/)
    song_name = file_array[1]
    artist_name = file_array[0]
    genre_type = file_array[2]
    song = Song.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_type)
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end
