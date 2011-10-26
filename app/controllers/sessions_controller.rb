class SessionsController < ApplicationController
  # def callback
  #   auth # Do what you want with the auth hash!
  # end

  # def auth; request.env['omniauth.auth'] end

  def new
	end

	def create
		user = User.find_by_name(params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			Rails.logger.info "inloggad!"
			redirect_to user, :notice => "logged in!"
		else
			flash.now.alert = "invalid name or psw"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "logged out!"
	end
end