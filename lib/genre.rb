class Genre
  attr_accessor :name
  extend Concerns::Findable

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def genre
    @genre
  end
  
  def songs
    @songs
  end
  
  def self.create(name)
    new(name).tap{|a| a.save}
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end

  def artists
    artists = @songs.map { |song| song.artist }
    artists.uniq
  end
  

end