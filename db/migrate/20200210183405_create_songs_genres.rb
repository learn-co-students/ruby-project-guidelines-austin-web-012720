class CreateSongsGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :songs_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
