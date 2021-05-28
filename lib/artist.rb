class Artist
    extend Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods

    attr_accessor :name
    @@all = []

    def self.all
        @@all
    end

    def intitialize
        save
    end

    # def self.create(name)
    #     new(name).save
    # end

end