class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :writer

  private

  validates :story_id, :writer_id, presence: true
end
