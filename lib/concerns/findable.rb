require "pry"

module Concerns::Findable
  
  def find_by_name(name)
    self.all.find {|songs| songs.name == name}
  end
  
  def find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

# binding.pry  
  
end


# module Concerns::Findable
  
#   def find_by_name(name)
#     self.all.find {|songs| songs.name == name}.class
#   end
  
#   def find_or_create_by_name(name)
#       if self.find_by_name(name) == NilClass
#         self.create(name)
#       else
#         self.all.find {|songs| songs.name == name}.class
#     end
#   end 
  
# end
  
