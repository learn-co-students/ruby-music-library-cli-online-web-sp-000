class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
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
    @@all = []
  end
  def self.create(name)
    song = Genre.new(name).tap do |s|
      s.save
    end
  end
  def add_song(song)
    if @songs.detect{|s| s == song} == nil
      @songs << song
    end
  end
  def artists
    artist_array = []
    self.songs.each{|s| artist_array << s.artist if !artist_array.include?(s.artist)}
    artist_array
  end
end
