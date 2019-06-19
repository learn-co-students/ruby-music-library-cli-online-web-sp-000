module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect {|instance| instance.name == name}
    end

    def find_or_create_by_name(name)
      self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
    end
  end

  module Nameable
    def name=(name)
      @name = name
    end
  end

  module Instance_all
    def initialize(name)
      @name = name
    end

    def save
      self.class.all << self
    end
  end

  module Class_all
    def destroy_all
      self.all.clear
    end

    def create(object)
      instance = self.new(object).tap do |i|
        i.name = object
        i.save
      end
    end
  end

end
