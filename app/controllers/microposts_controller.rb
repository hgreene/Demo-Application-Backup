class MicropostsController < ApplicationController
	before_filter :authenticate, :only =>[:create, :destroy]
	before_filter :authorized_user, :only => :destroy

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "Micropost Created!"
			redirect_to blog_forum_path
		else
			@feed_items = []
			render 'pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_back_or blog_forum_path
	end

	private

		def authorized_user
			@micropost = Micropost.find(params[:id])
			redirect_to blog_forum unless current_user?(@micropost.user)
		end

end