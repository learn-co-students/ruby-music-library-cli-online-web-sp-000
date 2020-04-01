require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

 @@all = []

  def initialize(title, artist = nil, genre = nil)
    @name = title
    # @artist = artist
    # @genre = genre
    if artist
      self.artist=(artist)
    else
      @artist = artist
    end
    if genre
      self.genre=(genre)
    else
      @genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(title)
    newSong = Song.new(title)
    newSong.save
    newSong
  end

  def artist=(artist)
    @artist = artist
    # @artist = Artist.find_or_create_by_name(artist).name
    artist.add_song(self)
    # Artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(title)
    self.all.detect {|s| s.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create(title)
    end
  end

  def self.new_from_filename(filename)
    # song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
    file = filename.split(".mp3")[0].split(" - ")
    # Song.create(file[1])
    # self.new(file[1], file[0], file[2])
    new_from_file = Song.create(file[1])
    new_from_file.artist=(file[0])
    # binding.pry

    # @artist= file[1]
    # @genre= file[2]
    #return a Song instance, w/
      #@name
      # @artist = Artist instance
      # @genre = Genre instance
    # expect(song.name).to eq("For Love I Come")
    # expect(song.artist.name).to eq("Thundercat")
    # expect(song.genre.name).to eq("dance")
  end
end
