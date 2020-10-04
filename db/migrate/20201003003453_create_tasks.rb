class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.date :deadline
      t.timestamps
    end
  end
end
