class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    self.have_an_artist(song)

    if !(@songs.include? (song))
          @songs << song
    elsif
         nil
    end
  end

  def have_an_artist(song)
    if song.artist == nil
        song.artist = self
    elsif
        nil
    end
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
    created_artist = self.new(name).save
    @@all.last
  end

  def genres
    song_genres = self.songs.collect {|song| song.genre}
      song_genres.uniq
  end
end
