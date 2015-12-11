class AddEmailToWriters < ActiveRecord::Migration
  def change
    add_column :writers, :email, :string
  end
end
