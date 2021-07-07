require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre


  @@all = []
  def initialize(name, songs = nil, genre = nil)
    @name = name
    @songs = []
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

  def self.create(name)
     new_artist = self.new(name)
     new_artist.save
     new_artist
  end

  def add_song(song_name) # to look like Mozart.add_song("sonatina in G")
    # binding.pry
    if song_name.artist == nil
           song_name.artist = self
    end
    if !(@songs.include? song_name)
       @songs<< song_name
    end
  #  binding.pry
  end

  def songs
    @songs
  end

  def genres
    song_genres = self.songs.collect {|song| song.genre}.uniq
    #song_genres.uniq
  end

  def self.sort_artists
    count = 1
    sorted_array = self.all.uniq.sort_by {|artist| artist.name}
    sorted_array.collect do |i|
      puts "#{count}. #{i.name}"
      count += 1
    #  binding.pry
    end
  end
end
