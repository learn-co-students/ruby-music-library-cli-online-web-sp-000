require 'pry'
module Concerns
  
  module Findable
    def find_by_name(name)
      all.detect { |thing| thing.name == name }
    end
    
    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end 
  end
  
  module InstanceMethods
    def save
      self.class.all << self
    end
    
    def add_song(song)
      thing = self.class.name.downcase
      song.send("#{thing}=", self) if !song.send(thing) 
      songs << song if !songs.include?(song)
    end 
  end
  
  module ClassMethods
    def create(name)
      self.new(name).tap do |thing| 
        thing.save
        all_sorted_by_name 
      end
    end
    
    def destroy_all
      all.clear 
    end 
    
    def all_sorted_by_name
      all.sort_by! { |thing| thing.name }
    end
    
    def list_all
      all_sorted_by_name.each.with_index(1) { |thing, index| puts "#{index}. #{thing.name}" }
    end
    
  end
end 