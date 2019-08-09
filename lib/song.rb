class Song 
  extend Concerns::Findable
  attr_accessor :name , :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = "", genre = "")
    @name = name
    self.artist = artist unless artist == ""
    self.genre = genre unless genre == ""
    save
  end
  
  def self.all 
    @@all
  end

  def save 
    @@all << self unless @@all.include?(self)
  end 
  
  def self.destroy_all 
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end
  
   def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    genre.add_song(self)
  end
  
  def self.new_from_filename(file)
    artist = Artist.find_or_create_by_name(file.split(' - ')[0])
    genre = Genre.find_or_create_by_name(file.split(' - ')[2].split('.')[0])
    song_name = file.split(' - ')[1]
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end  
  
end