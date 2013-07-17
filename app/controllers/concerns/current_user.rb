module CurrentUser
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def sign_in_user(user)
    cookies[:user_id] = user.id
  end

  def sign_out_user(user)
    cookies[:user_id] = nil
  end

  def current_user
    @_current_user ||= User.find_by_id(cookies[:user_id])
  end

end
