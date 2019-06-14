json.array! @tags.each do |tag|
  if tag.dream.is_public == false
    tag.dream.user.username = "anonymous"
    json.partial! "tag.json.jbuilder", tag: tag
  #   tag.dream.content
  else
    json.partial! "tag.json.jbuilder", tag: tag
    json.read_more do
      json.username tag.dream.user.username
      json.dream_content tag.dream.content
    end
  end
end
