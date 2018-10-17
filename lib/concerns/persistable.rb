module Persistable

  def save
    self.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def count
    self.all.size
  end

end
