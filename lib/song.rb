require_relative '../lib/concerns/Findable.rb'
require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :artist
  @@all=[]
  
  def initialize(name,artist=nil,genre=nil)
    @name=name
    @artist=artist
    @genre=genre
    save
  end
  
  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end
  def save
    @@all<< self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song=self.new(name)
    song.save
    song
  end
  
  def self.new_from_filename(filename)
    #"Thundercat - For Love I Come - dance.mp3"
    
    artist=Artist.find_or_create_by_name(filename.split(" - ")[0])
    song=self.find_or_create_by_name(filename.split(" - ")[1])
    genre=Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    song.artist=artist
    song.genre=genre
  end

end

#learn spec/005_songs_and_genres_spec.rb
#learn spec/004_songs_and_artists_spec.rb
#learn spec/006_artists_and_genres_spec.rb
#learn spec/007_findable_songs_spec.rb
#learn spec/009_music_importer_spec.rb
#learn spec/008_findable_module_spec.rb