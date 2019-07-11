json.array! @dreams.each do |dream|
  json.partial! "dream.json.jbuilder", dream: dream
  json.tags do
    json.array! dream.tags, partial: "api/tags/tag", as: :tag
  end
  json.user do
    json.partial! dream.user, partial: "api/users/user", as: :user
    # json.array! dream.user, partial: "api/users/user", as: :user
  end
  json.themes do
    json.array! dream.themes, partial: "api/themes/theme", as: :theme
  end
  # json.array! @themes.each do |theme|
  #   json.partial! "theme.json.jbuilder", theme: theme
  # end 
end

#need to make dreams index show user info and tag info for each dream 


# copied from dreams show
# json.user do
#   json.partial! @dream.user, partial: "api/users/user", as: :user
# end

# json.tags do
#   json.array! @dream.tags, partial: "api/tags/tag", as: :tag
# end