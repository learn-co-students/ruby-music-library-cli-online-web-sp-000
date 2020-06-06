class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all=[]
  extend Concerns::Findable

  def initialize(name,artist=nil,genre=nil)
    @name=name
    self.artist=artist if artist
    self.genre=genre if genre
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.songs<<self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all<<self
  end

  def self.destroy_all
    @@all=[]
  end

  def self.create(name)
    song=new(name)
    song.save
    song
  end
  #Real Estate - Green Aisles - country.mp3
  def self.new_from_filename(file_name)
    song_name=file_name.split(" - ")[1]
    artist_name=file_name.split(" - ")[0]
    genre_name=file_name.split(" - ")[2].gsub(".mp3","")
    @name=song_name
    artist=Artist.find_or_create_by_name(artist_name)
    genre=Genre.find_or_create_by_name(genre_name)
    Song.new(song_name,artist,genre)
  end

  def self.create_from_filename(name)
    song=new_from_filename(name)
    song.save
    song
  end

end
