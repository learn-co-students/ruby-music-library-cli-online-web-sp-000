class Genre 
  extend Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  
attr_accessor :name :songs

def.self.all
@@all
end

def initialize
  save
end
end

def self.find_by_name(name)
  @@all.detect{|artist| artist.name == name}
end
end

