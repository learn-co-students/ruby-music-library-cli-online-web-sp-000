class Artist
    attr_accessor :name, :songs

    extend Concerns::Findable

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end

    def add_song(song)
      song.artist = self unless song.artist == self
      @songs << song unless @songs.include?(song)
    end

    def genres
    arr = songs.collect {|song|
       song.genre }
       arr.uniq
    end

    def self.find_artist_or_create_by_name(name)
      if Artist.all.length == 0
        Artist.new(name)
      else
        Artist.all.each do |artist|
        if artist.name == name
          return artist
        else
          return Artist.new(name)
        end
      end
    end
  end
end
