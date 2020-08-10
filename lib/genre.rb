

class Genre

  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
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

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def self.create(name)
    Genre.new(name).tap{|new_genre|new_genre.save}
  end

  def songs
  @songs
  end

def artists
    self.songs.collect{|song|song.artist}.uniq
end

end
