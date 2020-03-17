module Concerns::Findable

  def find_by_name(name)
    self.all.select{|s| s.name == name}.first
  end

  def find_or_create_by_name(name)
    result = find_by_name(name)
    if result
      return result
    else
      return self.create(name)
    end
  end

  def song_name(file_name)
    file_name.split(/( - )|(.mp3)/)[2]
  end

  def artist_name(file_name)
    file_name.split(/( - )|(.mp3)/)[0]
  end

  def genre_name(file_name)
    file_name.split(/( - )|(.mp3)/)[4]
  end
end
