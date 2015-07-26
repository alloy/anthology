class Writer < ActiveRecord::Base
  belongs_to :cadre

  validates :cadre_id, :name, presence: true
end
