class Artist

  attr_accessor :name

  @@artists = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@artists
  end

  def self.destroy_all
    @@artists.clear
  end

  def save
    names = []
    self.class.all.each do |object|
      names << object.name
    end

    if !names.include?(self.name)
      self.class.all << self
    end
  end

  def self.create(name)
    names = []
    self.all.each do |object|
      names << object.name
    end

    if !names.include?(name)
      new_object = self.new(name)
      new_object.save
      new_object
    end
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
