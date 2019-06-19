class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []


  def initialize(name, artist=nil, genre=nil)
    @name = name
    # @artist = artist unless artist == nil
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    # @genre = genre unless genre == nil
  end

  def self.all
    @@all
  end


  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all  << self
  end

  def self.create(name, artist=nil, genre=nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")
    song_name = name[1]
    artist = Artist.find_or_create_by_name(name[0])
    genre = Genre.find_or_create_by_name(name[2].split(".")[0])
    self.create(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end



  def artist=(artist)
    # @artist = Artist.find_or_create_by_name(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    # @genre = Genre.find_or_create_by_name(genre)
    @genre = genre
    @genre.add_song(self)
  end

  # def self.find_by_name(name)
  #   self.all.find {|item| item.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  # end





end
