class FellowsController < ApplicationController
  before_action :unauthenticated_fellow_only!, only: [:new, :create]
  before_action :authenticate_fellow!, except: :create

  def index
    @fellows = Fellow.all
  end

  def create
    @fellow = Fellow.new sign_up_params
    if @fellow.save
      redirect_to :root, notice: "Your account created successfully, but we need to verify your email address. Please check your email #{@fellow.email} and click on the confirm link to finalize your account"
    else
      redirect_to :root, notice: 'Sorry! Something went wrong.'
    end
  end

  def show
    @fellow = current_fellow
  end

  def edit
    @fellow = current_fellow
  end

  def update
    @fellow = Fellow.find current_fellow.id
    if @fellow.update_fellow params
      redirect_to fellow_path, notice: 'Profile updated successfully.'
    else
      render 'edit'
    end
  end

  private

  def sign_up_params
    params.require(:fellow).permit(:name, :email, :password, :password_confirmation)
  end

  def settings_params
    params.require(:fellow).permit(:name, :email, :password, :password_confirmation, :about_me, :region, :gender)
  end


end
