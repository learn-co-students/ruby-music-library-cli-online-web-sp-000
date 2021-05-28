class Genre
    extend Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods

    attr_accessor :name, :songs
    @@all = []

    def self.all
        @@all
    end

    def intitialize
        save
    end
    
end