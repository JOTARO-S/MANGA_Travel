class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
   
   def set_search
     @user_categories = Category.all
     @range = params[:range]
      if @range == "タイトル"
        @search = Post.ransack(params[:q])
      elsif @range == "場所名"
        @search = Post.ransack(params[:q])
      elsif @range == "タグ"
        @search = Post.ransack(params[:q])
      elsif @range == "カテゴリー"
        @search = Post.ransack(params[:q])
      else
        @search = User.ransack(params[:q])
      end
       @search_content = @search.result(distinct: true)
   end 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
