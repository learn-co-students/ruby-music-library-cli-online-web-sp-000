class Song
  @@all = []
  attr_accessor :name

  #Hook
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  #Class methods

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
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    filename_arr = filename[0...filename.length-4].split(" - ")
    song = Song.find_or_create_by_name(filename_arr[1])
    song.artist = Artist.find_or_create_by_name(filename_arr[0])
    song.genre = Genre.find_or_create_by_name(filename_arr[2])
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  #Instance methods
  def save
    self.class.all << self
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
    genre.songs << self if !genre.songs.include?(self)
  end

end
