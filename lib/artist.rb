

class Artist

  #connects through song
  #artist == genre structure

  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    save
  end


  #same for all classes
  def self.create(name)
    Artist.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end



  #instance methods
  def save
    @@all << self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
