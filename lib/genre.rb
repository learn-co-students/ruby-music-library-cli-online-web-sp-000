class Genre
    extend Concerns::Findable
    attr_accessor :name, :artist, :song

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
      @@all << self
    end

    def songs
      @songs
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
      created_genre = self.new(name).save
      @@all.last
    end

    def add_song(song)
      self.have_a_genre(song)

      if !(@songs.include? (song))
         @songs << song
      elsif
        nil
      end
   end

   def have_a_genre(song)
       if song.genre == nil
           song.genre = self
       elsif
           nil
       end
   end

   def artists
     song_artists = self.songs.collect {|song| song.artist}
        song_artists.uniq
   end
end
