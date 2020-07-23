class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist= artist if artist!=nil
    self.genre= genre if genre!=nil
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

  ##The .create method  initializes, saves, and returns the song
  def self.create(name)
    created_song = self.new(name).save
    @@all.last
  end

  #invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  #returns (does not recreate) an existing song with the provided name if one exists in @@all
  #invokes .find_by_name instead of re-coding the same functionality
  #creates a song if an existing match is not found
  #invokes .create instead of re-coding the same functionality
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    separated_file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(separated_file[0])
    genre = Genre.find_or_create_by_name(separated_file[2])
    self.new(separated_file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  #Class method that is used to sort for method 'list_songs' in MusicLibraryController CLI methods.
  def self.sort_songs
      counter = 1
      sorted_array = self.all.uniq.sort_by{|s|s.name}
      sorted_array.map do |e|
        puts "#{counter}. #{e.artist.name} - #{e.name} - #{e.genre.name}"
        counter += 1
       end
    end
end
