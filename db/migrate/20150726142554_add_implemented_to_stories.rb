class AddImplementedToStories < ActiveRecord::Migration
  def change
    add_column :stories, :implemented, :boolean
  end
end
