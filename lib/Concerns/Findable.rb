require 'pry'
module Concerns::Findable

  def find_by_name(name)
    found = self.all.select {|x| x.name==name}
    #binding.pry
    if found.is_a?(Object)
      found.first
    end
  end

  def find_or_create_by_name(name)
    found = find_by_name(name)
    if !found.nil?
      found
    else
      self.create(name)
    end
  end

end
