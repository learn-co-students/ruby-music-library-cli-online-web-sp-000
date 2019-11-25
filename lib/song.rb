require "pry"
class Song
attr_accessor :name, :artist, :genre

@@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist= (artist) if artist != nil
    self.genre= (genre) if genre != nil
  end

  def self.all #class reader
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name) #initialize new song
    song.save
    song
  end

  def artist
    @artist
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre #assigns the genre to the song
    @genre
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    passedSong = filename.split(" - ")
    song_name = passedSong[1]
    song_artist = passedSong[0]
    song_genre = passedSong[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(song_artist)
    genre = Genre.find_or_create_by_name(song_genre)

    self.new(song_name,artist,genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


end
