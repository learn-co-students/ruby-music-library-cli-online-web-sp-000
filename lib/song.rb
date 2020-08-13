# rspec spec/001_song_basics_spec.rb

class Song

  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    if artist != ""
      self.artist = artist
    end
    if genre != ""
      self.genre = genre
    end
    save
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

  def self.create(name)
    self.new(name)
  end

  # #artist=invokes Artist#add_song to add itself to the artist's collection of songs
  
  def artist=(artist)
    artist.add_song(self)
  end

  # def genre=(genre)
  #   @genre = genre
  #   Song.all.find do |song| 
  #     song.genre != self
  #       @@all << self
  #   end
  # end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    @@all.find {|song| song.name == name} || self.new(name)
  end

end