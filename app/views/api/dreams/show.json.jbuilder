json.partial! "dream.json.jbuilder", dream: @dream

json.user do
  json.partial! @dream.user, partial: "api/users/user", as: :user
end

json.tags do
  json.array! @dream.tags, partial: "api/tags/tag", as: :tag
end

json.themes @dream.themes