class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name)
    created_song = Song.new(name)
    @@all << created_song
    created_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(file_name)
    parse = file_name.split(" - ")
    song_name = parse[1] #name of song
    artist_name = parse[0] #name of artist
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = parse[2].chomp(".mp3") #name of genre
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = self.new(song_name, artist, genre)  #Song.new(name)
    new_song #new song instance
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end
end
