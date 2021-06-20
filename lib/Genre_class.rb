class Genre
    attr_accessor :name

    #extend Findable::ClassMethods
    extend Concerns::Findable

    @@all = []

    def initialize (name)
        @name = name
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(genre)
        genre = self.new(genre)
        genre.save
        genre
    end

    def songs
        Song.all.select {|song| song.genre == self}
    end

    def artists
        songs.collect {|song| song.artist}.uniq  
    end

end