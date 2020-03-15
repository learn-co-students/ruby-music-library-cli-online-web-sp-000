class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :song
  @@all=[]

  def initialize (name)
    @name=name
    @songs =[]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.clear
  end

  def self.count
    @@all.size
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

 def self.create (name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
   @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
   self.songs << song unless self.songs.include?(song)
 end

 def genres
   songs.collect(&:genre).uniq
 end
end
