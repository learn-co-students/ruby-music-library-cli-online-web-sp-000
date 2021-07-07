require 'pry'
class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = artist if artist !=nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
  end

  def self.find_by_name(song_name)
    all.detect {|song| song.name == song_name}
  end

  def self.create(song_name)
    new_song = self.new(song_name)
    new_song.save
    new_song
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.new_from_filename(file)
    file_array = file.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file_array[0])
    genre = Genre.find_or_create_by_name(file_array[2])
    self.new(file_array[1], artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
     genre.add_song(self)
    end
  end

  def self.sort_songs
    count = 1
    sorted_array = self.all.uniq.sort_by {|song| song.name}
    sorted_array.collect do |i|
      puts "#{count}. #{i.artist.name} - #{i.name} - #{i.genre.name}"
      count += 1
    #  binding.pry
    end
  end

end
