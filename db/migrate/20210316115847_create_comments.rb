class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.text :body
      t.timestamps
    end
  end
end
