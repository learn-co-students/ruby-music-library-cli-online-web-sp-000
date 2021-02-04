require_relative './002_artist_basics_spec.rb'

class Song
  @@all = []
  Concerns::Findable

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self if !(@@all.include?(self))
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    #puts "Song created: #{song.name}."
    song
  end

  def self.find_by_name(name)
    return @@all.detect do |song| song.name == name end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
      #binding.pry
      #create(name)
  end

  def normalize(file)
    split1 = file.split(".")
    normal = split1[0].split(" - ")
    binding.pry
  end

  def self.new_from_filename(file)
    split1 = file.split(".")
    normal = split1[0].split(" - ")
    #name = self.find_or_create_by_name(nam)
    artist = Artist.find_or_create_by_name(normal[0])
    genre = Genre.find_or_create_by_name(normal[2])
    song = Song.new(normal[1], artist, genre)
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end


end
