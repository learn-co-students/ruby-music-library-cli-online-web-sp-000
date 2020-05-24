class MusicLibraryController
    def initialize(path='./db/mp3s')
        # @path = path
       @a = MusicImporter.new(path)
        @a = @a.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
           a = gets
         until
            gets.chomp == "exit"
         end
         
        if a == "list songs"
            list_songs
        elsif a == "list artists"
            list_artists
        elsif a == "list genres"
            list_genres
        elsif a == "list artist"
            list_songs_by_artist
        elsif a == "list genre"
            list_songs_by_genre
        elsif a == "play song"
            play_song
        end
    end

    def list_songs
       
     
    # b = glob(@a)
        
        # @a = @a.map{|r| r = r[0...-4] }
        # @a = @a.sort_by(/^ {3}*/)
        #     @a
        i = 1
        
       b = @a.map do |a|
           Song.new_from_filename(a)
        end
        b = b.sort{|a, b| a.name <=> b.name}

       b = b.map do |song|
        ["#{song.artist.name}", "#{song.name}", "#{song.genre.name}"].join(" - ")
       end
        b.each do |o| 
                #   binding.pry
                
            puts "#{i}. " + o
            i += 1
        end
    end

    def list_artists
        # binding.pry

        #  b = @a.map do |a|
        #     Song.new_from_filename(a)
        #  end
        b = Artist.all
         b = b.map do |song|
            song.name
         end
         b.uniq!
         b = b.sort{|a, b| a <=> b}
        #    binding.pry
        i = 1
        b.each do |o|
            puts "#{i}. " + o
            i += 1
        end 
    end



    def list_genres
        b = Genre.all
        b = b.map do |genre|
            genre.name
        end
        b = b.sort{|a, b| a <=> b}
        i = 1
        b.each do |o|
            puts "#{i}. " + o
            i += 1
        end 

    end


    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        a = gets.chomp
        # binding.pry
        b = Artist.find_by_name(a)
        #  binding.pry
        songz = []
       if b != nil
            b.songs.each do |song|
    
                if song.artist.name == a
                    songz << song
                end
            end
            songz.uniq!
            i = 1
            songz.sort!{|a, b| a.name <=> b.name}
            songz.each do |song|
                
               puts "#{i}. #{song.name} - #{song.genre.name}"
                i += 1
            end 
        
       end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        a = gets.chomp
        b = Genre.find_by_name(a)
        #  binding.pry
        songz = []
       if b != nil
            b.songs.each do |song|
    
                if song.genre.name == a
                    songz << song
                end
            end
            i = 1
            songz.sort!{|a, b| a.name <=> b.name}
            songz.each do |song|
                
               puts "#{i}. #{song.artist.name} - #{song.name}"
                i += 1
            end 
        
       end
    end

    def play_song
        puts "Which song number would you like to play?"
        a = gets.chomp
        if a.to_i > 0
        b = @a
        a = a.to_i
        if a > b.length
            return
        else
        name = b[a]
        if name == nil
        return
        else
        
        file = Song.new_from_filename(name)
        
        puts "Playing #{file.name} by #{file.artist.name}"
        end
    end
    end
    end


end
