class Song

    @@all = []

    attr_accessor :artist, :name, :genre

    def initialize(name, artist=nil, genre=nil)
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
        @name = name
        @@all << self

    end


def self.all
@@all
end

def self.create(name)
    Artist.new(name)
    @@all << self
    self
#if !self.all.include?(name)
end



def artist_name=(name)

    artist = Artist.find_or_create_by_name(name)

    self.artist = artist
end

def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
end

def self.find_by_name(name)
    @@all.select do |song|
        song.name 
  end
end

def self.find_or_create_by_name(name)
self.find_by_name(name) || self.create(name)
#binding.pry
end



def self.new_by_filename(file)

    row = file
        data = row.split(" - ")
          artist_name = data[0]
          song_name = data[1].delete_suffix(".mp3").strip
          song = Song.new(song_name)
          song.artist_name = artist_name
          song
    end
 
 
    def self.destroy_all
    @@all.clear
end

def save
    @@all << self
end


    def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
    end
end
