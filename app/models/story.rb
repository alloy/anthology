class Story < ActiveRecord::Base
  SENTENCE_FORMAT = 'As a %s, I want %s, so that %s.'

  belongs_to :role
  belongs_to :writer
  belongs_to :cadre
  has_many :comments

  belongs_to :parent, :class_name => 'Story'
  has_many :children, :class_name => 'Story', :foreign_key => :parent_id

  # Forward these to the parent story.
  [:cadre, :role, :feature, :objective].each do |attribute|
    define_method(attribute) { super() || parent.try(attribute) }
  end

  def to_sentence
    SENTENCE_FORMAT % [role.name.downcase, feature, objective]
  end

  private

  validates :role_id, :cadre_id, :feature, :objective, presence: true, unless: :parent_id
  validates :writer_id, presence: true
end
