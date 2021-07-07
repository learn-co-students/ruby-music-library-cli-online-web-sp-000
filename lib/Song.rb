class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
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
    song = Song.new(name)
    @@all << song
    song
  end
  def artist=(artist)
    @artist = artist
    if artist != nil
      @artist.add_song(self)
    end
  end
  def genre=(genre)
    @genre = genre
    # if genre != nil && !genre.songs.include?(self)
      if genre != nil
        genre.add_song(self)
    end
  end
  def self.find_by_name(name)
    song = nil
    @@all.each do |item|
      if item.name == name
        song = item
      end
    end
    song
  end
  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    if song == nil
      song = self.create(name)
    end
    song
  end
  def self.new_from_filename(fileStr)
    songArr = fileStr.split(" - ")
    songName = songArr[1]
    artistName = songArr[0]
    genreName = songArr[2].sub(".mp3", "")
    artist = Artist.find_or_create_by_name(artistName)
    genre = Genre.find_or_create_by_name(genreName)
    song = Song.new(songName, artist, genre)
    @@all << song
    song
  end
  def self.create_from_filename(fileStr)
    new_from_filename(fileStr)
  end
end
