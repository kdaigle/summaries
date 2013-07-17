class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    sign_in_user(@user)
    redirect_to root_path
  end

  def destroy
    sign_out_user(current_user)

    redirect_to root_path
  end

  # Private: A helper method to access the auth_hash.
  #
  # Returns a Hash.
  def auth_hash
    request.env["omniauth.auth"]
  end

end
