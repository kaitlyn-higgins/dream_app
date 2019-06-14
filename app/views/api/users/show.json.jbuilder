json.partial! "user.json.jbuilder", user: @user
# end
if current_user == @user
  json.user do
    json.email @user.email
    json.zip_code @user.zip_code
    json.gender @user.gender
    json.dreams @user.dreams
  end
end