class Playlist < ActiveRecord::Base
    belongs_to :user
    has_and_belongs_to_many :songs

    def add_song(title, artist)
        song = RSpotify::Track.search(title)

        track_found = song.select do |track|
            if track.album.artists[0].name == artist
                track
            end
        end


        #finds artist page
        #uri_found = track_found[0].album.artists[0].uri

        s = Song.create(title: title)
        a = Artist.create(name: artist)
        SongsArtists.create(song: s, artist: a)
        PlaylistsSongs.create(playlist: self, song: s)
    end

    def display_playlist
        songids = PlaylistsSongs.all.map do |row|
            if row.playlist == self
                row.song_id
            end
        end
        
        song_artist_array = []
       SongsArtists.all.map do |sa_row|
            songids.each do |si_row|
                if sa_row.song_id == si_row
                    song_artist_array << sa_row
                end
            end
        end

        table_data = []

        index = 0

        song_artist_array.each do |sa_row|
            table_data << {songs: sa_row.song.title, artists: sa_row.artist.name, track_no: index+=1 }
        end

        # Formatador.display_table(table_data)
        table_data

    end

    def display_playlist_as_table
        Formatador.display_table(self.display_playlist)
    end

    def play_song(selection_number)
        song = nil
        self.display_playlist.each do |row|
            if row[:track_no] == selection_number
                song = row[:songs]
            end
        end

        artist = nil
        self.display_playlist.each do |row|
            if row[:track_no] == selection_number
                artist = row[:artists]
            end
        end


        if artist == nil || song == nil
            return "Song is not in #{self.name} playlist"
        else
            system("spotify play #{song} #{artist}")
        end
        #can also accomplish by array index no.-1

    end

    def rename_playlist(name)
        self.update(name: name)
    end

    
    def delete_song(selection_number)


        


        # Songs.all.each do |s|
        #     PlaylistsSongs.all.each do |ps|
        #         if ps.playlist == self 
                    
        #         end
        #     end
        # end

        song = nil
        self.display_playlist.each do |row|
            if row[:track_no] == selection_number
                song = row[:songs]
            end
        end


        PlaylistsSongs.all.each do |pls|
            if pls.song.title == song && pls.playlist == self
                pls.destroy
                binding.pry
            end
        end
    end


end