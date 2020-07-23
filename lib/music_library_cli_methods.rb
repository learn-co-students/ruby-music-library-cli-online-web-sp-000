class CLIMethods

    def list_songs
      songs = Song.all.sort_by {|song| song.name}
      	songs.each_with_index do |song, index|
      	#binding.pry
        puts "#{index +1}. " "#{song.artist.name} - #{song.name}" " - " "#{song.genre.name} ".strip
      end
    end

    def list_artists
      artists = Artist.all.sort_by {|artist| artist.name}
      	artists.each_with_index do |artist, index|
      	#binding.pry
        puts "#{index +1}. " "#{artist.name}"
      end
    end

    def list_genres
      genres = Genre.all.sort_by {|genre| genre.name}
      	genres.each_with_index do |genre, index|
      	#binding.pry
        puts "#{index +1}. " "#{genre.name}"
      end
    end

    def list_songs_by_artist
      #list_artists
      puts "Please enter the name of an artist:"
      input = gets.chomp

      if artist = Artist.find_by_name(input)
      	artist.songs.sort{|x, y| x.name <=> y.name}.each_with_index do |song, index|
         puts "#{index +1}. " "#{song.name} - #{song.genre.name} ".strip
      	 end
      end
    end

    def list_songs_by_genre
      #list_genres
      puts "Please enter the name of a genre:"
      input = gets.chomp

      if genre = Genre.find_by_name(input)
      	genre.songs.sort{|x, y| x.name <=> y.name}.each_with_index do |song, index|
         puts "#{index +1}. " "#{song.artist.name} - #{song.name} ".strip
      	 end
      end
    end

    def play_song
      #list_songs
      puts "Which song number would you like to play?"
      input = gets.chomp.to_i
      songs = Song.all.sort_by {|song| song.name}
      	songs.each_with_index do |song, index|
		if index == input-1
      	  puts "Playing #{song.name} by #{song.artist.name}"
      	end
      end
    end

  end
