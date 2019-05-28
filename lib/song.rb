class Song
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)

    @name = name
      if artist && genre
        self.artist=(artist)
        self.genre=(genre)
      elsif artist 
        self.artist=(artist)
      elsif genre
        self.genre=(genre)
      else
        @artist = artist
        @genre = genre
      end
    save << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name)
  end

  def self.destroy_all
    @@all.clear
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def self.find_by_name(name)
    all.find { |item| item.name == name }
  end

  def find_or_create_by_name(name)
    if find_by_name(name).nil?
      create(name)
    else
      find_by_name(name)
    end
  end   

  def self.new_from_filename(file)
    song_file = file.split(" - ")
    song_name = song_file[1]
    singer_name = song_file[0]
    genre_name = song_file[2]
    #get index where . lives
    index = genre_name.index('.')
    #get string from the beginning to before the . lives
    genre = Genre.find_or_create_by_name(genre_name[0..index - 1])
    song_artist = Artist.find_or_create_by_name(singer_name)
    song = self.new(song_name, song_artist, genre)
    song_artist.add_song(song)
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end
end