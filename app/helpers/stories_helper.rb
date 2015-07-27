module StoriesHelper
  
  def to_html_sentence(story)
    "As a <strong>#{story.role.name.downcase}</strong> I want <strong>#{story.feature}</strong>, so that <strong>#{story.objective}.</strong>"
  end
  
end
