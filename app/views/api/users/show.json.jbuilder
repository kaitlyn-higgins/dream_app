json.partial! "user.json.jbuilder", user: @user

json.dreams do
  json.array! @user.dreams.each do |dream|
    json.partial! "api/dreams/dream", dream: dream
    json.tags do
      json.array! dream.tags, partial: "api/tags/tag", as: :tag
    end
  end
end

