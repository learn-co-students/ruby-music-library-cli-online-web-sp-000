# rspec spec/008_findable_module_spec.rb

module Concerns::Findable

  def find_by_name(name)
    self.all.find {|a| a.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end

end