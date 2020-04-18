require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    # @artist = artist
    self.artist = artist if artist
    # @genre = genre
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
      song = self.new(name)
      song.save
      song
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
    new_array = genre.songs << self
    if new_array.uniq!
      new_array
    else
      genre.songs
    end
  end

  def self.find_by_name(name)
     all.detect {|song| song.name == name}
  end

   def self.find_or_create_by_name(name)
     if self.find_by_name(name)
       self.find_by_name(name)
     else
       self.create(name)
     end
   end

   def self.new_from_filename(path)
     split_array = path.chomp(".mp3").split(" - ")
     artist, name, genre = split_array[0], split_array[1], split_array[2]
     genre = Genre.find_or_create_by_name(genre)
     artist = Artist.find_or_create_by_name(artist)

     self.new(name,artist,genre)
   end

   def self.create_from_filename(filename)
     new_from_filename(filename).tap{|s| s.save}
   end

end
