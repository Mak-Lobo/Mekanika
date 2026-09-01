class SignUpsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  rate_limit to: 10, within: 2.minutes, only: :create, with: -> { redirect_to signup_path, alert: "You have exceeded the maximum number of sign up attempts. Please try again later." }

  def new
    @user = User.new
    render "pages/register"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for @user
      redirect_to home_path, notice: "Your account was created successfully."
    else
      render "pages/register", status: :unprocessable_entity
    end
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :phone_number,
        :email_address,
        :password,
        :password_confirmation
      )
    end

  # # Keep the legacy endpoint available while the signup flow uses new/create.
  # def show
  # end
end
