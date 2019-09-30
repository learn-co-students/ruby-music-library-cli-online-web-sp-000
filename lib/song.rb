require 'pry'


class Song
  
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      create(name)
    end
  end
  
  def self.new_from_filename(filename)
    music_importer = MusicImporter.new(filename)
    song_name = music_importer.file_parser
    Song.find_or_create_by_name(song_name)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
    @artist
  end
  
  def artist
    @artist
  end
  
  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
    @genre
  end
  
  def genre
    @genre
  end
end