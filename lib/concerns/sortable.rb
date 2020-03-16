module Sortable

#def find_by_name (name)
#self.class.all.detect {|x| x.name == name}
#end

#def sort_by_name
#arr = self.class.all
#name_sort(arr)
#end

def name_sort(arr)
arr.sort{|a, b| a.name <=> b.name}
end

#def list_maker
#end

end
