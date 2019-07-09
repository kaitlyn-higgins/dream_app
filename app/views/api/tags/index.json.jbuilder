json.formatted_series tag_tally

json.tags do
  json.array! @tags.each do |tag|
    json.partial! "tag.json.jbuilder", tag: tag
  end 
end