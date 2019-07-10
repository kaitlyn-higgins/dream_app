class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def show
    @user = User.find(params[:id])
    # @user = User.find(current_user.id)
    render 'show.json.jbuilder'
  end

  def create
    @user = User.new(
      email: params[:email],
      username: params[:username],
      zip_code: params[:zip_code],
      gender: params[:gender],
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
    @user = User.find(current_user.id)
    @user.email = params[:email] || @user.email
    @user.username = params[:username] || @user.username
    @user.zip_code = params[:zip_code] || @user.zip_code
    @user.gender = params[:gender] || @user.gender
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