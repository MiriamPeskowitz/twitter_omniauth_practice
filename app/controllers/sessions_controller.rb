class SessionsController < ApplicationController
	def create
		@user = User.find_or_create_from_auth_hash(auth_hash)
		session[:user_id]= @user.id
		redirect_to root_path
	end 

	# or, for line 3, use this: 
	#  @user = User.find_or_create_by(uid: auth['uid']) do |u|
 #      u.name = auth['info']['name']
 #      u.email = auth['info']['email']
 #      u.image = auth['info']['image']
 #    end

	def destroy
		if current_user
			session.delete(:user_id)
			flash[:success] = "Successfully logged out"
		end 
		redirect_to root_path
	end 
	
	protected #private? 

	def auth_hash
		request.env['omniauth.auth']
	end 
end 

# could be: 
#  def auth
#     request.env['omniauth.auth']
#   end