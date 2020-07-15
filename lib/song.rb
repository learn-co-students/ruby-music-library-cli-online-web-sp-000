class Song

  #extend Concerns::Findable

  attr_accessor :name
  attr_reader   :genre, :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil then self.artist=(artist)
    end
    if genre != nil then self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def artist=(artist)
      @artist = artist
      @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new_song=self.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    @@all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.new_from_filename(filename)
    song=self.new(filename.split(" - ")[1])
    song.artist=Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre=Genre.find_or_create_by_name((filename.split(" - ")[2]).gsub(/\.mp3/, ''))
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
