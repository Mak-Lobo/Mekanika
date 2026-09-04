# frozen_string_literal: true

class Settings::ProfilesController < ApplicationController
  def show
  end

  def update
    if Current.user.update(profile_params)
      redirect_to settings_profile_path, status: :see_other, notice: "Your profile was updated successfully."
    else
      render :show, status: :unprocessable_entity
    end
  end

  # delete the account entirely
  def destroy
    terminate_session
    Current.user.destroy
    redirect_to about_path, notice: "Your account has been successfully terminated."
  end

  private

  def profile_params
    params.expect(user: [:first_name, :last_name, :phone_number])
  end
end
