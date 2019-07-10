  json.array! @themes.each do |theme|
    json.partial! "theme.json.jbuilder", theme: theme
  end 