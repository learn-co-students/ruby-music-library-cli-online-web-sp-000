class Song

  @@all = []

  attr_accessor :name, :artist, :genre, :path

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    # save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

# Instantiates an instance using .new, saves, returns new song
  def self.create (name)
      song = Song.new(name)
      song.save
      song
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")

    song_name = file_array[1]
    song_artist = file_array[0]
    song_genre = file_array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
  # Goes through method above and saves into the @@all array
    self.new_from_filename(filename).save
  end


end
