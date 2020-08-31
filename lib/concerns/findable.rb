module Concerns::Findable

  def find_by_name(inputName)
    self.all.each do | selectedThing |
      if (selectedThing.name == inputName)
        return selectedThing
      end
    end
    return nil
  end

  def find_or_create_by_name(inputName)
    if (self.find_by_name(inputName) == nil)
      return self.create(inputName)
    else
      return self.find_by_name(inputName)
    end
  end

end
