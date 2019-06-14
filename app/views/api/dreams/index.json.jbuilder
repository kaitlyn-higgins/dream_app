json.array! @dreams.each do |dream|
  if dream.is_public == true
  json.partial! "dream.json.jbuilder", dream: dream
end
end