class Artist

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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)

    new_object = Artist.new(name)
    new_object.save
    new_object
  end

  def songs
    @songs
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end

    if song.artist == nil
      song.artist=(self)
    end

    if song.genre != nil
      if !self.genres.include(song.genre)
        self.genres << song.genre
      end
    end
  end

  def genres
    genre_list = []
    @songs.each do |song|
      if !genre_list.include?(song.genre)
        genre_list << song.genre
      end
    end
    genre_list
  end

end
