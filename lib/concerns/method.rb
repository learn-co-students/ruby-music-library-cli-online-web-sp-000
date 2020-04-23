module Concerns

  module Findable

    def find_by_name(song_name)
      self.all.select{|x| x.name == song_name}[0]
    end

    def find_or_create_by_name(name)
      if name == nil
        nil
      elsif self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create(name)
      end
    end

  end

  module Methods
    module ClassMethods
      def destroy_all
        self.all.clear
      end

      def create(name)
        new_obj = self.new(name)
        new_obj.save[0]
        new_obj
      end
    end

    module InstanceMethods


      def save
        self.class.all << self
      end

    end

  end
end
