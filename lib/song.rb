require 'pry'
# include Concerns::Findable

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
# binding.pry
    song = Song.new(*name)
    song.save
    song
  end

  def artist=(name)
    @artist = name
      name.add_song(self)
  end

  def genre=(name)
    @genre = name
    name.add_song(self)
  end

  def self.find_by_name(name)
    # if @@all.find {|song| song.name == name}
      @@all.find {|song| song.name == name}
      # end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(name)
    name = name.chomp!(".mp3")
    name = name.split(" - ")
    artist = Artist.find_or_create_by_name(name[0])
    genre = Genre.find_or_create_by_name(name[2])
    metadata = [name[1], artist, genre]
    song = Song.create(metadata)
  end

  def self.create_from_filename(name)
    new_from_filename(name)
  end

end
