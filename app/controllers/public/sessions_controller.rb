# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
def guest_sign_in
    user = User.find_or_create_by(email: "guest@example.com") do |user|
      user.id = 1
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now # ← Confirmable を設定している場合は追加
      user.name = "ゲストユーザー" # ←ユーザー名を設定している場合は追加
      user.explanation = "ゲストユーザーです。"
    end
    sign_in user # ← Deviseのログインメソッド
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
end
  
protected

  def after_sign_in_path_for(resource)
      root_path
      
  end

  def after_sign_out_path_for(resource)
      root_path
  end
  
  def reject_user
    @user = User.find_by(email: params[:user][:email])
   return if !@user
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration_path
      else
        flash[:notice] = "入力に間違いがあります。"
      end
  end
  
  
  
end
