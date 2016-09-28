class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
