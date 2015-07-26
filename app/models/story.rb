class Story < ActiveRecord::Base
  belongs_to :role
  belongs_to :writer
  belongs_to :cadre

  validates :role_id, :writer_id, :cadre_id, :feature, :objective, presence: true
end
