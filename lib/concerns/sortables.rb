module Concerns::Sortables

    module ClassMethods

        def sort_with_index
             self.all.sort{|a, b| a.name <=> b.name}.each_with_index do |item, index|
               puts "#{index +1}. #{item.self.name}"
             end
        end
    end
    
    module InstanceMethods 
        
        def list_with_index
            self.songs.sort{|a, b| a.name <=> b.name}.each_with_index do |item, index| 
              puts "#{index +1}. #{item.name} - #{item.self.name}"
            end
        end
    end
    
end