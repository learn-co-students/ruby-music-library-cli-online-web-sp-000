class Song
  @@all = []
  attr_accessor :name

  def initialize(name, inputArtist = nil, inputGenre = nil)
    @name = name
    self.genre=(inputGenre)
    self.artist=(inputArtist)
  end

  def artist=(input)
    if (input == nil)
      return
    end
    @artist = input
    if !(@artist.songs.include?(self))
      @artist.add_song(self)
    end
  end

  def artist
    @artist
  end

  def genre=(inputGenre)
    if (inputGenre == nil)
      return
    end
    @genre = inputGenre
    if !(@genre.songs.include?(self))
      @genre.add_song(self)
    end
  end

  def genre
    @genre
  end

  def save
    @@all << self
  end

  def self.create(inputName)
    newSong = Song.new(inputName)
    newSong.save
    return newSong
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.find_by_name(inputName)
    @@all.each do | selectedSong |
      if (selectedSong.name == inputName)
        return selectedSong
      end
    end
    return nil
  end

  def self.find_or_create_by_name(inputName)
    if (self.find_by_name(inputName) == nil)
      return Song.create(inputName)
    else
      return self.find_by_name(inputName)
    end
  end

  def self.new_from_filename(filename)
    mp3Split = filename.split(" - ")
    songName = mp3Split[1]
    artistName = mp3Split[0]
    genreName = mp3Split[2]
    genreName = genreName.split(".")[0]
  #  actualGenre = nil
  #  actualArtist = nil
  #  Artist.all.each do | selectedArtist |
  #    if selectedArtist.name == artistName
  #      actualArtist = selectedArtist
  #    end
  #  end
  #  if (actualArtist == nil)
  #    actualArtist = Artist.new(artistName)
  #  end
  #  Genre.all.each do | selectedGenre |
  #    if (selectedGenre.name == genreName)
  #      actualGenre = selectedGenre
  #    end
  #  end
  #  if (actualGenre == nil)
  #    actualGenre = Genre.new(genreName)
  #  end
    actualArtist = Artist.find_or_create_by_name(artistName)
    actualGenre = Genre.find_or_create_by_name(genreName)

    newSong = self.find_or_create_by_name(songName)
    newSong.artist = actualArtist
    newSong.genre = actualGenre
    #binding.pry
    return newSong
  end

  def self.create_from_filename(filename)
    newSong = self.new_from_filename(filename)
    newSong.save
    return newSong
  end


end
