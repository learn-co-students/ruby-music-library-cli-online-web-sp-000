class Artist
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  # def songs
  #   Song.all.each do |song|
  #      @songs << song if song.artist == self 
  #   end
  #   @songs
  # end

  def add_song(song)
    unless song.artist
      @songs << song
      song.artist = self
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def genres
    songs.map {|song| song.genre }.uniq
  end

end