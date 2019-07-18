module Concerns::Findable
  def find_by_name(input)
    all.detect {|i| i.name == input}
    #binding.pry
  end

  def find_or_create_by_name(i)
    self.find_by_name(i) || self.create(i)
  end
end
