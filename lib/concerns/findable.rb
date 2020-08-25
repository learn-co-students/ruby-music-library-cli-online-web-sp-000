module Concerns::Findable

#remember code in modules should never have @ or @@. would not work
#also the name of methods should not have the word self. itg is determined by context
#self in body is fine.

def find_by_name(name) #intended to be CLASS METHOD
  self.all.find do | instance |
    instance.name == name
  end
end #end method

def find_or_create_by_name(name) #CLASS METHOD
  searchresult = self.find_by_name(name)
  # binding.pry
  if searchresult
    return searchresult
  else #aka nil
    self.create(name) #aka Song.create
  end
end #end method

end #end module
