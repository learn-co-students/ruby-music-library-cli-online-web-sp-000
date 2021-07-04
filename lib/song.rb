class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song
  end

  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end

  def genre=(genre)
    if @genre == nil
      @genre = genre
    else
      @genre = @genre
    end
    if self.genre != nil
      @genre.add_song(self)
    end
    @genre
  end

  def self.find_by_name(name)
    self.all.detect { |s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end

  def self.new_from_filename(file_name)
    name_string = file_name.split(" - ") [1]
    artist_string = file_name.split(" - ") [0]
    genre_string = file_name.gsub(".mp3", "").split(" - ") [2]
    artist = Artist.find_or_create_by_name(artist_string)
    genre = Genre.find_or_create_by_name(genre_string)

    self.new(name_string, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end
end
