class Role < ActiveRecord::Base
  private

  validates :name, :definition, presence: true
end
