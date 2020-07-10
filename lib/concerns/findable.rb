module Concerns
  module Findable


    def create(name)
      self.new(name)
    end

    # def create(name)
    #   return self.new(name)
    # end

    # def find_or_create_by_name(name)
    #   found = all.find_by_name(name)
    #   found ? found : self.class.new(name)
    # end

def list
  list = self.all.map {|object| object.name}
  list.sort!
  return list
end




    def find_or_create_by_name(name)
      found = self.find_by_name(name)
      found ? found : self.create(name)
    end

    def find_by_name(name)
      all.detect{|a| a.name == name}
    end

    def count
      self.all.count
    end

    def all
      return self.all
    end

    def parse_filename(filename)
      parsed_filename = filename.split(" - ")
    end

    def destroy_all
      self.all.clear
    end
  end


  module InstanceMethods
    def initialize

      self.class.all << self
      @name = name
    end

    def save
      self.class.all << self
    end


  end
end
