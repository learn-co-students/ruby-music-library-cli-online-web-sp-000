class Song
  extend Memorable::ClassMethods, Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
    #@@all << self
  end

  def self.all
    @@all
  end

  def artist=(artist)
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre != nil
      @genre = genre
      genre.add_song(self)
    end
    #@artist.add_genre(genre) if @artist != nil
  end

  #def self.create(name)
  #  new_song = Song.new(name)
  #  new_song.save
  #  new_song
  #end


  def self.new_from_filename(filename)
    split = filename.split(" - ")
    name = split[1]
    genre_name = split[2].chomp(".mp3")
    artist_name = split[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  #def self.destroy_all
  #  @@all.clear
  #end

  #def save
  #  @@all << self
  #end

  #def self.create(name)
  #  Song.new(name)
  #end
end
