class AddPhotoDataToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :photo_data, :text
  end
end
