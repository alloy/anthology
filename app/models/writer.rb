class Writer < ActiveRecord::Base
  belongs_to :cadre

  private

  validates :cadre_id, :name, presence: true
end
