class SessionsController < ApplicationController
  layout "slim"
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url, notice: "Connexion réussie. Bienvenue #{user.username} !"
    else
      redirect_to new_session_path, alert: "Email ou mot de passe incorrect."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "Vous avez été déconnecté avec succès."
  end
end
