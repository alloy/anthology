class CreateCadres < ActiveRecord::Migration
  def change
    create_table :cadres do |t|
      t.string :name
      t.string :definition

      t.timestamps null: false
    end
  end
end
