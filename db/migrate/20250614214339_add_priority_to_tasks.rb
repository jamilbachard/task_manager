class AddPriorityToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :priority, :integer, default: 1, null: false
    add_index :tasks, :priority
  end
end
