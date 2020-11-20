module Concerns::Sortable
  module ClassMethods

    def sort_by_name
      self.all.sort { |a, b| a.name <=> b.name }
    end

    def sort_and_print_by_name
      self.sort_by_name.each_with_index do |a, index|
        puts "#{index + 1}. #{a.name}"
       end
    end

  end

  module InstanceMethods
    def sort_object_by_name
      self.songs.sort { |a, b| a.name <=> b.name }
    end

  end

end
