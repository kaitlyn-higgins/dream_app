json.dream_id dream.id
json.user_id dream.user_id
json.title dream.title
# json.content dream.content
json.image_url dream.image_url
json.is_public dream.is_public
json.tags do
  json.array! dream.tags, partial: "api/tags/tag", as: :tag
end
