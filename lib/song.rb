class Song
  @@all = []
  attr_accessor :name, :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end
  
  def artist=(artist)
    @artist = artist
    if artist
      artist.add_song(self)
    end
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

  def genre=(genre)
    @genre = genre
    if genre
      genre.songs << self unless genre.songs.include?(self)
    end
    @genre
  end    

  def self.create(name)
    new(name).tap{ |g| g.save }
  end
  
  ## ---
  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  ## ---
  
  def self.new_from_filename(filename)
    split = filename.split("-")
    Song.new(split[0].strip, split[1].strip, split[2].strip.gsub(".mp3", ""))
  end
  
  # def self.create_from_file_name(filename)
  # end
  
  
  
end