class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: [:create]

  def show
    @user = User.find(params[:id])
    # @user = User.find(current_user.id)
    render 'show.json.jbuilder'
  end

  def create
    # cloudinary
    response = Cloudinary::Uploader.upload(params[:photo])
    cloudinary_url = response["secure_url"]



    # PRINTS THE COORDINATES TO THE SERVER LOG!
        coordinates = Geocoder.coordinates(params[:zip_code])
        p "===========================#{coordinates}" 
        p Geocoder.search(params[:zip_code])
        # geocodio = Geocodio::Client.new("API_KEY")
        # coordinates = geocodio.geocode(params[:zip_code])
        # p "===========================#{coordinates}" 



    @user = User.new(
      email: params[:email],
      username: params[:username],
      gender: params[:gender],
      zip_code: params[:zip_code],
      latitude: coordinates[0].to_f,
      longitude: coordinates[1].to_f,
      photo: cloudinary_url,
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def update
    # cloudinary

    
   

    coordinates = Geocoder.coordinates(params[:zip_code])
    p "===========================#{coordinates}" 
    p Geocoder.search(params[:zip_code])

    # geocodio = Geocodio::Client.new("26c6244d252252d42dd72c6d548576882578cd5")
    # coordinates = geocodio.geocode(params[:zip_code])
    p "===========================#{coordinates}" 

    @user = User.find(current_user.id)
    @user.email = params[:email] || @user.email
    @user.username = params[:username] || @user.username
    @user.zip_code = params[:zip_code] || @user.zip_code
    @user.gender = params[:gender] || @user.gender
    @user.latitude = coordinates[0] || @user.latitude
    @user.longitude = coordinates[1] || @user.longitude
    if params[:photo]
      response = Cloudinary::Uploader.upload(params[:photo])
      cloudinary_url = response["secure_url"]
      @user.photo = cloudinary_url || @user.photo

    elsif params[:photo] == "undefined"
      @user.photo = @user.photo
    end

    if params[:password]
      @user.password = params[:password]
      @user.password_confirmation = params[:password_confirmation]
    end

    
    if @user.save
      render 'show.json.jbuilder'
    else render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "Account successfully destroyed."}
  end

end



    # @product.name = params[:name] || @product.name
    # @product.price = params[:price] || @product.price
    # @product.description = params[:description] || @product.description
    # @product.stock_status = params[:stock_status] || @product.stock_status
    # @product.supplier_id = params[:supplier_id] || @product.supplier_id