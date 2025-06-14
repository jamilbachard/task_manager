class PasswordsController < ApplicationController
  layout "slim"
  allow_unauthenticated_access
  before_action :set_user_by_token, only: %i[ edit update ]

  def new
  end

  def create
    if user = User.find_by(email_address: params[:email_address])
      PasswordsMailer.reset(user).deliver_later
      redirect_to new_session_path, notice: "Les instructions de réinitialisation ont été envoyées à votre adresse email."
    else
      flash.now[:alert] = "Aucun compte n'est associé à cette adresse email."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(params.permit(:password, :password_confirmation))
      redirect_to new_session_path, notice: "Votre mot de passe a été réinitialisé avec succès."
    else
      redirect_to edit_password_path(params[:token]), alert: "Les mots de passe ne correspondent pas."
    end
  end

  private
    def set_user_by_token
      @user = User.find_by_password_reset_token!(params[:token])
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to new_password_path, alert: "Le lien de réinitialisation est invalide ou a expiré."
    end
end
