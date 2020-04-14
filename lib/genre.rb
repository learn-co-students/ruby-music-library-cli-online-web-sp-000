class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_genre = self.new(name).save.last
  end

  def add_song(song)
    if song.genre == self
      if !@songs.find {|s| s == song}
        @songs << song
      end
    elsif !song.genre
      song.genre = self
    end
  end

  def artists
    all_artists = []
    self.songs.each do |s|
      if !all_artists.include?(s.artist)
        all_artists << s.artist
      end
    end
    all_artists
  end
end
