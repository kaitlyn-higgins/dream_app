json.partial! "tag.json.jbuilder", tag: @tag

json.associated_dreams do
  json.array! @tag.associated_dreams, partial: "api/dreams/dream", as: :dream
end  