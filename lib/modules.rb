module Concerns::Findable

  def find_by_name(target)
    all.detect {|s| s.name == target}
  end

  def find_or_create_by_name(target)
    if find_by_name(target)
      find_by_name(target)
    else
      create(target)
    end
  end
end
