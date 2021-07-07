# Song class and rspec: rspec spec/001_song_basics_spec.rb
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

# basics
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    new = self.new(name, artist, genre)
    new.save
    new
  end
# end basics

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    object = nil
    self.all.each do |element|
      if element.name == name
        object = element
      end
    end
    object
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(file_name)
    info_array = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(info_array[0])
    genre = Genre.find_or_create_by_name(info_array[2].chomp('.mp3'))
    self.new(info_array[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    new = self.new_from_filename(file_name)
    new.save
    new
  end


end

# findable songs rspec: rspec spec/007_findable_songs_spec.rb
# findable module rspec: rspec spec/008_findable_module_spec.rb
