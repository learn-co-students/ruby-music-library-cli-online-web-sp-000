module Concerns::Findable
  def find_by_name(name)
    all.find { |a| a.name == name }
  end

  def find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      new(name)
      save
    end
  end
end
