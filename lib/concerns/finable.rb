module Concerns::Findable
  # Module code here
  def find_by_name(name)
    out = nil 
    all.each do |x|
      if x.name == name 
        out = x 
      end 
    end 
    return out
  end
  
  def find_or_create_by_name(name) 
    out = find_by_name(name)
    if(out == nil)
      out = create(name)
    end
    return out 
  end
end
