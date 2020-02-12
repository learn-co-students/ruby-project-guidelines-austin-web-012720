RSpotify.authenticate("a09377aa120c4a68ba377892982cb5cf", "c3a52e31188c43b6930c737fbe8a3026")
# recommendations = RSpotify::Recommendations.generate(limit: 1, seed_genres: ['chill', 'focus'])
# rec_songs = recommendations.tracks
# p rec_songs.collect {|x| x.name}
# artist_array = rec_songs.collect {|x| x.artists}
# clean_artist_array = artist_array[0]
# p clean_artist_array.collect{|x| x.name}

# ap rec_songs

p sorry = RSpotify::Track.search("Sorry")

#Create user, set as variable
user = User.create(name: "Matt")

#After login
    #Store UserID
    current_user = user.id

#Create playlist from user variable
pl = Playlist.create(name: "Playlist 1", user: user)
Playlist.create(name: "Playlist 2", user: user)
    
#Display user playlists
user_playlists = Playlist.where(user_id: 1)
    #Select playlist - array value is user input
    selected_playlist = user_playlists[0]
    #Display selected playlist name
    user_playlists.collect{|x| x.name}
        #Store current playlist ID
        playid = selected_playlist.id
    #Display songs on playlist

    #Add song to playlist method
        #Search for a song
        #p song = RSpotify::Track.search("Sorry").collect{|x| x.name}
        
        
    #PlaylistSongs.new(playlist_id: playid, song_id = )


# Playlist.create(name: "Playlist 1", user_id: User.all.last)
# Song.create(title: "Rolling in the Deep")
# Artist.create(name: "Beyonce")
# SongsArtists.create(song_id: Song.all.last.id, artist_id: Artist.all.last.id)
# Genre.create(genre: "Pop")
# SongsGenres.create(song_id: Song.all.last.id, genre_id: Genre.all.last.id)
# PlaylistsSongs.create(playlist_id: Playlist.all.last.id, song_id: Song.all.last.id)
# User.create(name: "Aaiden")
# User.create(name: "Fred")
# Song.create(title: "Lofi 2")
# Song.create(title: "Hifi 1")
# Artist.create(name: "Jay-Z")
# Artist.create(name: "Will Smith")
# Playlist.create(name: "Playlist 2")
# Playlist.create(name: "Playlist 3")

#::::::::::::::MORE METHODS:::::::::::

pl.add_song("Sorry", "Demi Lovato")
pl.add_song("heroes", "David Bowie")
pl.add_song("La Dispute", "Yann Tiersen")
pl.add_song("Love is Blindness", "Jack White")