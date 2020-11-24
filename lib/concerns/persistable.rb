module Concerns::Persistable
  module ClassMethods

    def create(name)
      self.new(name).tap do|s|
          s.save
        end
      #or:
      #genre = self.new(name)
      #genre.save
      #genre
    end

    def destroy_all
      self.all.clear
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end

end
