class Song
  extend Concerns::Findable


  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    # self.artist = artist will evoke artist= if there IS an artist
    self.genre = genre if genre
      # self.artist = artist will evoke artist= if there IS an artist
  end

  def artist=(artist)
    @artist = artist # this is the main line of variable= method
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre  # this is the main line of variable= methods
    genre.songs.push self unless genre.songs.include? self # unless = guard clause
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    all.detect{ |song_name| song_name.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end


  def self.create(name)  # this method bypasses #initialize!
    song = new(name)
    song.save
    song
  end

  def self.new_from_filename(name)
    artist, song, genre = name.split(' - ')
    genre = genre.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

end
