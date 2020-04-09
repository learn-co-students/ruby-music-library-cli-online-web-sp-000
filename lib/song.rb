class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if self.artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if self.genre
  end

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
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.new_from_filename(filename)
    attributes = filename.chomp(".mp3").split(" - ")
    song_name = attributes[1]
    song_artist = attributes[0]
    song_genre = attributes[2]

    artist_instance = Artist.find_or_create_by_name(song_artist)
    genre_instance = Genre.find_or_create_by_name(song_genre)

    if find_by_name(song_name)
      song = find_by_name(song_name)
      song.artist = artist_instance if !song.artist
      song.genre = genre_instance if !song.genre
      
    elsif find_by_name(song_name) == nil
      new_song = new(song_name, artist_instance, genre_instance)
      new_song.save
      new_song
    end
  end

end
