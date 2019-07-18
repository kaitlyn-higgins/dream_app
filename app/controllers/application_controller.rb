class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  add_flash_types :success

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

  def theme_tally
    dreams = Dream.all

    all_themes = []

    dreams.each do |dream|
      all_themes << dream.themes.map{ |themes| themes.name}
    end

    all_themes_flat = all_themes.flatten
    counts = Hash.new(0)
    all_themes_flat.each { |name| counts[name] += 1}

    sorted_count = counts.sort_by{|k,v| v}.reverse

    formatted_series = []

    sorted_count.each do |sub_array|
      formatted_series << {name: sub_array[0], value: sub_array[1]}
    end

    return formatted_series
    
  end
  helper_method :theme_tally

  # geocodio = Geocodio::Client.new("API_KEY")



  # def tags_lat
  #   tags = Tag.all

  #   latitude = []
  #   longitude = []


  #   tags.each do |tag|
  #     longitude << tag.dream.user.map{ |user| user.longitude}
  #     latitude << tag.dream.user.map{ |user| user.latitude}
  #   end
  #   # tags.each do |tag|
  #   #   latitude << tag.dream.user.longitude
  #   #   longitude << tag.dream.user.latitude
  #   #   # properties.store(:description, tag.name)
  #   # end

  #   coordinates = [latitude + longitude].flatten

  # end


  def map_tags
    # tags = Tag.where("name iLIKE ?", "%#{"adventure"}%")
    tags = Tag.all

    features = []
    tags.each do |tag|
      if tag.dream.user.longitude
        features << {
          type: "Feature",
          properties: {
            description: tag.name,
            icon: "theatre"
          },
          geometry: {
            type: "Point",
            coordinates: [tag.dream.user.longitude.to_f, tag.dream.user.latitude.to_f]
          }
        }
      end
    end

    return features
  end
  helper_method :map_tags


  def map_lat
    tags = Tag.all

    latitude = []
    tags.each do |tag|
      if tag.dream.user.latitude.to_f != 0
        latitude << tag.dream.user.latitude.to_f
      end
    end  
    return latitude
  end
  helper_method :map_lat

  def map_long
    tags = Tag.all

    longitude = []
    tags.each do |tag|
      if tag.dream.user.longitude.to_f != 0
        longitude << tag.dream.user.longitude.to_f
      end
    end  
    return longitude
  end
  helper_method :map_long



  def map_tags_list
    # tags = Tag.where("name iLIKE ?", "%#{"adventure"}%")
    users = User.all

    features = []
    users.each do |user|
      tag_names = []
      if user.longitude

        user.dreams.each do |dream|
          dream.tags.each do |tag|
            tag_names << tag.name
          end  
        end

        features << {
          type: "Feature",
          properties: {
            description: tag_names.join(" - "),
            icon: "theatre"
          },
          geometry: {
            type: "Point",
            coordinates: [user.longitude.to_f, user.latitude.to_f]
          }
        }
      end
    end

    return features
  end
  helper_method :map_tags_list



end