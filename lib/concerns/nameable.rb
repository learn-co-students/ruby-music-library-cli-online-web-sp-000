module Nameable
    module ClassMethods
      def creat_by_name(name)
        self.new.tap do |n|
          n.name = name
        end
      end
    end
end
