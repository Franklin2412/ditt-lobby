class SessionsController < ApplicationController
  before_action :authenticate_fellow!, only: [:destroy]

  before_action :unauthenticated_fellow_only!, only: [:new, :create]

  def new
    @fellow = Fellow.new
  end

  def create
    @fellow = Fellow.where(email: username_params[:email]).limit(1).take

    if validate(@fellow){ |password| @fellow.valid_password?(password) } && @fellow.confirmed?
      session[:fellow] = @fellow.id
      redirect_to fellow_path @fellow.id, notice: 'Signed in successfully'
    else
      @fellow = Fellow.new username_params
      @fellow.clean_up_passwords
      redirect_to :root, notice: "#{@fellow.confirmed? ? 'Invalid email/password' : 'Your account has not been confirmed yet! please check your email!'}"
    end
  end

  def destroy
    session[:fellow] = nil
    redirect_to :root, notice: 'You have been successfully logged out'
  end

  private

  def validate(resource, &block)
    resource && resource.valid_for_authentication?(username_params[:password], &block)
  end

  def username_params
    params.require(:fellow).permit(:email, :password)
  end
end
