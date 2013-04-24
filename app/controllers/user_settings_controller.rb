class UserSettingsController < ApplicationController
	before_filter :is_self?
	#layout 'user_settings'

	def edit_profile
		@user = User.find(params[:id])
	end

	def update_profile
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to profile_settings_user_path, notice: 'User profile was successfully updated.'
		else
			render :edit_profile
		end
	end

	def edit_account
		@user = User.find(params[:id])
	end

	def update_account
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to account_settings_user_path, notice: 'User account was successfully updated.'
		else
			render :edit_account
		end
	end

  private

    def is_self?
      unless current_user && current_user.id == params[:id].to_i
        permission_denied
      end
    end
end
