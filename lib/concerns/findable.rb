module Concerns
module Findable

def find_by_name(input)
  found_element = ""
    self.all.each do |element|
      if input == element.name
        found_element = element 
      end 
    end
      found_element
end 

def find_or_create_by_name(input)
found_element = self.find_by_name(input)
if found_element == ("")
    found_element = self.create(input)
  end 
found_element
end 

end 

end