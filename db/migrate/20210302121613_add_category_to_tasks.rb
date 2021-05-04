class AddCategoryToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :category, foreign_key: true
  end
end
