json.partial! "tag.json.jbuilder", tag: @tag

json.associated_dreams do
  json.array! @tag.associated_dreams.each do |dream|
    json.partial! "api/dreams/dream", dream: dream
    json.tags do
      json.array! dream.tags, partial: "api/tags/tag", as: :tag
    end

    json.themes do
      json.array! dream.themes, partial: "api/themes/theme", as: :theme
    end

    json.user do
     json.partial! "api/users/user", user: dream.user
    end

  end
end  
