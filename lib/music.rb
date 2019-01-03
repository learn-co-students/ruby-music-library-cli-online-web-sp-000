class Music
  
@@all = []

attr_accessor :name 

def initialize(name)
  @name =  name
end


def save
  @all << self
end

def destroy_all
  @all.clear
end

def all
  @all
end

end