require 'pry'

class Song
  extend Persistable
  include Persistable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil && self.artist == nil
    if artist != nil
      artist.songs << self
    end
    self.genre = genre if genre != nil && self.genre == nil
    if genre != nil
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.all_sorted
    all.sort_by!{|song| song.name}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    return_song = nil
      @@all.each do |song|
        if song.name == name
          return_song = song
        end
      end
    return_song
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      new_song = Song.create(name)
    else
      find_by_name(name)
    end
  end

  def self.new_from_filename(mp3_file)
    data = mp3_file.split(" - ")
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2].chop!.chop!.chop!.chop!)
    new_song = Song.new(data[1], artist, genre)
    new_song
  end

  def self.create_from_filename(mp3_file)
    new_song = new_from_filename(mp3_file)
    new_song.save
  end

end
