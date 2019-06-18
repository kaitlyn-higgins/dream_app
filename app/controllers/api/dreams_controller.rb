class Api::DreamsController < ApplicationController

  before_action :authenticate_user, except: [:index]

  def index
    @dreams = Dream.all
    render 'index.json.jbuilder'    
  end

  def create
    @dream = Dream.new(
      user_id: current_user.id,
      title: params[:title],
      content: params[:content],
      image_url: params[:image_url],
      is_public: params[:is_public]
      )
    if @dream.save
      @tag = Tag.create(dream_id: @dream.id, name: params[:tag1])
      @tag = Tag.create(dream_id: @dream.id, name: params[:tag2])
      @tag = Tag.create(dream_id: @dream.id, name: params[:tag3])
      render 'show.json.jbuilder'
    else render json: {errors: @dream.errors.full_messages}, status: unprocessable_entity
    end
  end

  def show
    @dream = Dream.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @dream = Dream.find(params[:id])
    # puts @dream.user.id 
    # puts current_user.id
    if @dream.user.id == current_user.id

      @dream.title = params[:title] || @dream.title
      @dream.content = params[:content] || @dream.content
      @dream.image_url = params[:image_url] || @dream.image_url
      @dream.is_public = params[:is_public] || @dream.is_public
      @dream.tags.destroy_all

      if @dream.save
        @tag1 = Tag.new(dream_id: @dream.id, name: params[:tag1])
        @tag2 = Tag.new(dream_id: @dream.id, name: params[:tag2])
        @tag3 = Tag.new(dream_id: @dream.id, name: params[:tag3])
        if @tag1.save && @tag2.save && @tag3.save
          render 'show.json.jbuilder'
        else 
          render json: {errors: @dream.errors.full_messages}, status: :unprocessable_entity
        end
      end
    end
    

  end


end
    # @user = User.find(params[:id])
    # @user.email = params[:email] || @user.email