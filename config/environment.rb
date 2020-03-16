require 'bundler'
require_relative '../lib/concerns/sortable'
Bundler.require



module Concerns

  module Findable

    def find_by_name (name)
      self.all.detect {|x| x.name == name}
    end

    def find_or_create_by_name(name)
      if  find_by_name(name) != nil
      return find_by_name(name)
     else
       self.create(name)
     end
    end

    def sort_by_name
    arr = self.all
    name_sort(arr)
    end

    def name_sort(arr)
    arr.sort{|a, b| a.name <=> b.name}
    end

  end

end

require_all 'lib'
