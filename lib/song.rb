class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
    song = Song.new(name)
    @name = name
    song.save
    song
  end

  def self.new_from_filename(file_name)
    song = file_name.split(" - ").tap do |a|
      a[2].chomp!(".mp3")
    end
    artist = Artist.find_or_create_by_name(song[0])
    genre = Genre.find_or_create_by_name(song[2])
    new_song = self.new(song[1], artist, genre)
  end
  #
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end


end
