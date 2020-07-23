module Concerns::Findable   
  def create(name)
    self.new(name)
  end

  def save
    self.class.all
  end

  def find_by_name(name)
    all.find { |item| item.name == name }
  end

  def find_or_create_by_name(name)
    if find_by_name(name).nil?
      song = create(name)
    else
      find_by_name(name)
    end
  end     
end