require 'pry'


class Song

  # # extend Memorable
  # extend Findable::ClassMethods
  # include Findable::InstanceMethods
  # # extend Findable
  # # include Paramable

  attr_accessor :name, :artist, :genre

 @@all = []



def initialize(name, new_artist = nil, new_genre = nil)
  @name = name
  unless new_artist == nil
    self.artist = new_artist
  end
  unless new_genre == nil
    self.genre = new_genre
  end
  save
end

def artist=(new_artist)
  @artist = new_artist
  new_artist.add_song(self)
end

def genre=(new_genre)
  @genre = new_genre
  new_genre.add_song(self)
end

def save
  @@all << self
end


# def artist=(new_artist)
#   @artist = new_artist
#   new_artist.add_song(self)
#   # artist.add_song(self)
#   # @artist = artist
#   # @artist.songs << self
# end


def self.all
  return @@all
end

def self.create(name)
return self.new(name)
end

def self.destroy_all
@@all.clear
end

# def self.new_by_filename(filename)
#   parsed_filename = filename.split(" - ")
#   song_name = parsed_filename[1]
#   Song.new(song_name)
#   song_name.artist_name = parsed_filename[0]
#   return song_name
#   end



  # def artist_name=(name)
  #     self.artist = (Artist.find_or_create_by_name(name))
  #     self.artist.add_song(self)
  # end

end
