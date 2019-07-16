json.partial! "user.json.jbuilder", user: @user

json.dreams do
  json.array! @user.dreams.each do |dream|
    json.partial! "api/dreams/dream", dream: dream
    json.tags do
      json.array! dream.tags, partial: "api/tags/tag", as: :tag
    end
    json.themes do
      json.array! dream.themes, partial: "api/themes/theme", as: :theme
    end
  end
end

