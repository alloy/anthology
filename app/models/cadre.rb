class Cadre < ActiveRecord::Base
  private

  validates :name, :definition, presence: true
end
