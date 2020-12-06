class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist
    self.genre = genre
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
    song = Song.find_by_name(name)
    if song == nil
      song = Song.new(name)
      song.save
    end
    song
  end

  def artist=(artist)
    @artist = artist
    if(self.artist != nil)
      self.artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if self.genre != nil && !self.genre.songs.include?(self)
      self.genre.songs << self
    end
  end

  def self.find_by_name(name)
    song = @@all.find do |song| song.name == name
    end
    song
  end

  def self.find_or_create_by_name(name)
    if @@all.include?(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

 def self.create_from_filename(file)
   song = Song.new_from_filename(file)
   song.save
 end

 def self.new_from_filename(file)
   str = file.delete_suffix(".mp3")
   strArr = str.split(" - ")

   name = strArr[1].strip
   #song = Song.create(name)
   song = Song.new(name)
   song.genre = Genre.find_or_create_by_name(strArr[2].strip)
   song.artist = Artist.find_or_create_by_name(strArr[0].strip)
   song
 end

end
