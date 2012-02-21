class PagesController < ApplicationController
  
  def home
  	@title = "Home"
  end

  def contact
  	@title = "Contact Information"
  end

  def about
  	@title = "About HTGBrando"
  end

  def help
  	@title = "Help?"
  end

  def blog_forum
  	@title = "Blog Forum"
    if signed_in?
    @micropost = Micropost.new if signed_in?
    @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

end
