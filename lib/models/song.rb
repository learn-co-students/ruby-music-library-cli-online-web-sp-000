class Song

extend  Concerns::Findable
attr_accessor :name
attr_reader :artist, :genre

@@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    # @artist = artist
    self.artist = artist if artist
    # @genre = genre
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do|song|
      song.save
    end
  end

  def self.new_from_filename(file)
    file = file.gsub(".mp3", "")
    artist, song, genre = file.split(" - ")
    song_artist = Artist.find_or_create_by_name(artist)
    song_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(song, song_artist, song_genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap{|song| song.save}
  end
end
