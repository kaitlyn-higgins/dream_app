json.array! @dreams.each do |dream|
  json.partial! "dream.json.jbuilder", dream: dream
end