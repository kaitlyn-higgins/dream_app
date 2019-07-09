class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def tag_tally
    tags = Tag.all.map{|tag| tag.name}
    tag_groups = []

    tags.each do |tag|
      tag_groups << tags.grep(/([\w-]*#{tag}[\w-]*)/)
    end

    unique_tag_groups = tag_groups.uniq
    count = {}

    unique_tag_groups.each do |group|
      sorted_by_length = group.sort_by(&:length)
      if sorted_by_length.count > 1
        count[sorted_by_length[0]] = sorted_by_length.count
      end
    end

    sorted_tag_tally = count.sort_by{|k,v| v}.reverse

    formatted_series = []    
    sorted_tag_tally.each do |sub_array|
      formatted_series << {name: sub_array[0], value: sub_array[1]}
    end

    return formatted_series

  end
  helper_method :tag_tally

end