class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  def index
    #using will_paginate gem
    @users = User.paginate(:page => params[:page])
    @title = "All Fucking Users"
  end

  
  def new
  	@user = User.new
  	@title = "Signup for the right to say stupid shit!"
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to the right to say stupid shit!"
  		redirect_to @user, :flash => {:success => "Welcome to the application!"}
  	else
  		@title = "Signup for the right to say stupid shit!"
  		render 'new'
  	end

  end

  def edit
    @title = "Edit User"
  end

 def update
    if @user.update_attributes(params[:user])
      flash[:success] = "You have updated the way to say stupid shit!"
      redirect_to @user
    else
      @title = "Edit the way to say stupid shit!"
      render 'edit'
    end

  end

  def destroy
    @user.destroy
    redirect_to users_path, :flash => {:success => "User DESTROYED!"}
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
    @microposts = @user.microposts.paginate(:page => params[:page])
  end
  
  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      @user = find(params[:id])
      redirect_to(root_path) if(!current_user.admin? || !current_user(@user))
    end
end