class Genre
    extend Concerns::Findable
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods
    
    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
      save
    end

    def self.all
        @@all
    end
  
    def artists
      self.songs.collect{|song| song.artist}.uniq
    end

    def songs
        Song.all.select {|song| song.genre == self}
    end
  
    # def add_song(song)
    #   song.genre = self unless song.genre == self
    # end  
  end