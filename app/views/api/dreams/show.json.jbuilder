if @dream.is_public == true || current_user == @dream.user
  json.partial! "dream.json.jbuilder", dream: @dream
end
