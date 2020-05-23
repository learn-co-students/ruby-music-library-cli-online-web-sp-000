require 'pry'
class Song
  attr_accessor :name, :artist, :song, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
      @name = name
    if artist
      self.artist = artist
    end
    if genre
       self.genre = genre
    end
  end

  def save
      @@all << self
  end

  def self.all
      @@all
  end

  def self.destroy_all
      @@all.clear
  end

  def self.create(name)
      a = self.new(name)
      @@all << a
      a
  end

  def artist=(artist)
      @artist = artist
      artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
    genre.song = self
    if genre.songs.include?(self)
      return
    else
      genre.songs << self
    end
    end
  
  def self.find_by_name(name)
      self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      a = self.find_by_name(name)
    if !a    
      self.create(name)
    else
        a    
        # binding.pry
    end
  end

  def self.new_from_filename(name)
    array = name.split(" - ")
    array_two = array[2].split(".")
# binding.pry
    a = Song.new(array[1])
    art = Artist.find_or_create_by_name(array[0])
    gen = Genre.find_or_create_by_name(array_two[0])
    a.artist = art
    a.genre = gen
    # a.genre.name = array_two[0]
    #  binding.pry
    b = self.find_by_name(a)
    if !b
      a
      # binding.pry
    end
  end

  def self.create_from_filename(name)
    a = new_from_filename(name)
    a.save
  end
end
