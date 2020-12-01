class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self if !self.genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    song = file_name.split(" - ")[1]
    artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].gsub(".mp3", ""))
    self.new(song, artist, genre)
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
end

#rspec spec/007_findable_songs_spec.rb
