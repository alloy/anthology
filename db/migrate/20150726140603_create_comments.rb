class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body

      t.references :writer, index: true, foreign_key: true
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
