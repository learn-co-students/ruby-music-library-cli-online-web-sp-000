require "pry"

class Song
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end

    if genre != nil
     self.genre = genre
    end
    save
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end


 def genre=(genre)
    @genre = genre
    genre.songs <<  self unless genre.songs.include?(self)
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song_name)
    Song.new(song_name)
  end


#  def self.find_by_name(song_name)
#    @@all.detect do |song| song.name == song_name
#    end
#    end



 def self.find_or_create_by_name(song_name)
     find_by_name(song_name) || create(song_name)
  end


end
