module Persistable
  module InstanceMethods
    def save #Instance Method
      self.all << self
    end
  end
  
  
  module ClassMethods
    def reset_all #deletes data saved there, class Method
      self.all.clear
  end
    def count #Class method
      self.all.size
    end
  end
end