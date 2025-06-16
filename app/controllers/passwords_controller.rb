class PasswordsController < ApplicationController
  layout "slim"
  allow_unauthenticated_access
  before_action :set_user_by_token, only: %i[ edit update ]

  def new
  end

  def create
    if user = User.find_by(email_address: params[:email_address])
      PasswordsMailer.reset(user).deliver_later
      redirect_to new_session_path, notice: "Reset instructions have been sent to your email address."
    else
      flash.now[:alert] = "No account is associated with this email address."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(params.permit(:password, :password_confirmation))
      redirect_to new_session_path, notice: "Your password has been successfully reset."
    else
      redirect_to edit_password_path(params[:token]), alert: "Passwords do not match."
    end
  end

  private
    def set_user_by_token
      @user = User.find_by_password_reset_token!(params[:token])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to new_password_path, alert: "The reset link is invalid or has expired."
    end
end
