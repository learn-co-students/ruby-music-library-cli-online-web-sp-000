module Persistable
    module InstanceMethods
      def save
        self.class.all << self
        self
      end
    end

    module ClassMethods
      def reset_all
        self.all.clear
      end

      def count
        self.all.size
      end

      def destroy_all
        self.all.clear
      end
      
      def create(name)
        new(name).save
      end
    end
end