class AddUserIdToFriendsInfos < ActiveRecord::Migration[6.1]
  def change
    add_column :friends_infos, :user_id, :integer
    add_index :friends_infos, :user_id
  end
end
