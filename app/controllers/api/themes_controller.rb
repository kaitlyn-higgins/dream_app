class Api::ThemesController < ApplicationController

  def index
    @themes = Theme.all
    render 'index.json.jbuilder'
  end


end
