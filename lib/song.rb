class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all=[]
  
  def initialize(name, artist=nil, genre=nil)
    @name=name
    self.artist=(artist) if artist!=nil
    self.genre=(genre) if genre!=nil
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Song.new(name).tap  {|song| song.save}
  end
  
  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name==name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? song=self.find_by_name(name) : song=self.create(name)
  end
  
  def self.new_from_filename(filename)
    parse = filename.split(" - ")
    parse[2].chomp!(".mp3")
    if !self.find_by_name(parse[1])
      song = Song.new(parse[1])
      song.artist=Artist.find_or_create_by_name(parse[0])
      song.genre=Genre.find_or_create_by_name(parse[2])
    else
      song=self.find_by_name(parse[1])
      song.artist=Artist.find_or_create_by_name(parse[0])
      song.genre=Genre.find_or_create_by_name(parse[2])
    end
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end