class Artist
	extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
  	@name = name
  	@songs = []
  end

  def self.all
  	@@all
  end

  def self.destroy_all
  	@@all = []
  end

  def save
  	@@all << self
  end

  def self.create(name)
  	@artist = Artist.new(name)
  	@artist.save
  	@artist
  end

  def songs
  	@songs
  end

  def genres
  	self.songs.map {|song| song.genre}.uniq
  end

  def add_song(song)
  	song.artist = self if !song.artist
  	self.songs << song unless self.songs.include?(song)
  end

  def find_by_name(name)
  end

end
