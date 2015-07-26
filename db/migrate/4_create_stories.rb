class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :feature
      t.string :objective

      t.references :role,   index: true
      t.references :writer, index: true
      t.references :cadre,  index: true

      t.timestamps null: false
    end
  end
end
