module Concerns::Findable
  
  #iterates through @@all and finds x whose name matches given name
  def find_by_name(name)
    all.find{|x| x.name == name}
  end
  
  def find_or_create_by_name(name)
    x = find_by_name(name)
    if x == nil
      create(name)
    else
      x
    end
  end
  
  
  
  
  
end