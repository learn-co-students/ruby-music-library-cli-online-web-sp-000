module Concerns
  
  module Findable 
    def find_by_name(ag_name)
      self.all.find{|ag| ag.name == ag_name}
    end 
    
    def find_or_create_by_name(ag_name)
      find_by_name(ag_name) != nil ? find_by_name(ag_name) : self.create(ag_name)
    end 
  end 
  
  #### NEW MOD ####
  
end 