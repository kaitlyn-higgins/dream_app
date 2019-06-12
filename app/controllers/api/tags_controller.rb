class Api::TagsController < ApplicationController

  def index
    @tags = Tag.all
    if params[:search]
      @tags = @tags.where("name iLIKE ?", "%#{params[:search]}%")
    end
    render 'index.json.jbuilder'
  end

  def show
    @tag = Tag.find(params[:id])
    render 'show.json.jbuilder'
  end

end

        # if params[:search]
        #   @products = @products.where("name iLIKE ?", "%#{params[:search]}%")
        # end

        # if params[:discount]
        #   @products = @products.where("price < ?", 10)
        # end

        # if params[:sort] == "price"
        #   if params[:sort_order] == "desc"
        #     @products = @products.order(price: :desc)
        #   else
        #     @products = @products.order(:price)
        #   end
        # end

        # if params[:category]
        #   category = Category.find_by(name: params[:category])
        #     @products = category.products
        # end