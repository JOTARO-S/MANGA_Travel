class User::Mailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers
  
  default template_path: 'public/mailer'
  
  def headers_for(action, opts)
    super.merge!(template_path: 'public/mailer')
  end

  def confirmation_instructions(record, token, opts={})
    if record.unconfirmed_email != nil
      opts[:subject] = "認証を行ってメールアドレス変更手続きを完了してください"
    else
      opts[:subject] = "認証を行ってユーザ登録を完了してください"
    end
    super
  end
end