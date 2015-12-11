class Writer < ActiveRecord::Base
  belongs_to :cadre

  private

  validates :cadre_id, :name, presence: true, on: :update
  validates :email, format: /@artsymail.com\z/
end
