class CreateFriendsInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :friends_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :instagram
      t.string :phone_number

      t.timestamps
    end
  end
end
