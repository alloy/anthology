class Story < ActiveRecord::Base
  SENTENCE_FORMAT = 'As a %s, I want %s, so that %s.'

  belongs_to :role
  belongs_to :writer
  belongs_to :cadre

  def to_sentence
    SENTENCE_FORMAT % [role.name.downcase, feature, objective]
  end

  private

  validates :role_id, :writer_id, :cadre_id, :feature, :objective, presence: true
end
