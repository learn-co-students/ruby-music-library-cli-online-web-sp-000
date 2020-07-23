require_relative "concerns/findable.rb"

class Song
extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

def name=(name)
    @name = name
end

def self.all
    @@all
end

def self.destroy_all
    @@all.clear
end

def self.create(name)
  item = self.new(name)
end

def save
    @@all << self
end

  def initialize(name = nil, artist = nil, genre = nil)
    if name !=nil
      @name = name
    end
    if artist.is_a?(Artist)
      self.artist=(artist)
    end
    if genre.is_a?(Genre)
      self.genre=(genre)
    end
    self.save
  end

  def genre=(genre)
    if self.genre == nil
      @genre = genre
       @genre.songs << self
     end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def self.new_from_filename(input)
    filename = input.split(" - ")
    new_artist = filename[0]
    new_song = filename[1]
    new_genre = filename[2].split(".")[0]

    new_song = Song.new(new_song)
    new_artist = Artist.find_or_create_by_name(new_artist)
    new_artist.add_song(new_song)
    new_song.genre = Genre.find_or_create_by_name(new_genre)
    new_song
  end

  def self.create_from_filename(input)
    self.new_from_filename(input)
  end


end
