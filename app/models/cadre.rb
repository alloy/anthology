class Cadre < ActiveRecord::Base
  validates :name, :definition, presence: true
end
