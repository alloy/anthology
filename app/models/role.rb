class Role < ActiveRecord::Base
  validates :name, :definition, presence: true
end
