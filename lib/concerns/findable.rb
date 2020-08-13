module Concerns::Findable
  
  def find_by_name(name)
    all.find { |s| s.name == name }
  end
  
  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
    # works because both Artist and Genre have #create methods
  end

end