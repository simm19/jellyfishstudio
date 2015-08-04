class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :technos
      t.integer :project_duration
      t.string :screenshot_small_1
      t.string :screenshot_small_2
      t.string :screenshot_small_3
      t.string :screenshot_big

      t.timestamps null: false
    end
  end
end
