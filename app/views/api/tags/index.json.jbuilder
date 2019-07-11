json.formatted_tag_series tag_tally
json.formatted_theme_series theme_tally

json.tags do
  json.array! @tags.each do |tag|
    json.partial! "tag.json.jbuilder", tag: tag
  end 
end