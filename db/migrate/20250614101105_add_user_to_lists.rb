class AddUserToLists < ActiveRecord::Migration[8.0]
  def up
    add_reference :lists, :user, null: true, foreign_key: true

    default_user = User.first
    if default_user
      List.update_all(user_id: default_user.id)
    end

    change_column_null :lists, :user_id, false
  end

  def down
    remove_reference :lists, :user
  end
end
