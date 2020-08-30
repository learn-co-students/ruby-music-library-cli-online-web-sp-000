require 'pry'
class Song
  attr_accessor :artist

  @@all = []


  def initialize(name, artist=nil, genre=nil)
    @name = name
    if genre !=nil
      self.genre = genre
    else
    end
    if artist != nil
      self.artist = artist
    else
    end
  end

  def name
    @name
  end

  def name=(name)
    @name = name
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
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    else
    end
  end

  def self.find_by_name(name)
    found = nil
    @@all.each do |song|
      if song.name == name
        found = song
      else
      end
    end
    return found
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      create(name)
    else
      find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    remove_mp3 = filename.gsub(".mp3","")
    new_song_artist = remove_mp3.split(" - ")[0]
    new_song_name = remove_mp3.split(" - ")[1]
    new_song_genre = remove_mp3.split(" - ")[2]

    song = Song.find_or_create_by_name(new_song_name)
    artist = Artist.find_or_create_by_name(new_song_artist)
    genre = Genre.find_or_create_by_name(new_song_genre)

    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

end
