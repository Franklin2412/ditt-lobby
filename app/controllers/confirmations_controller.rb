class ConfirmationsController < ApplicationController
  before_action :unauthenticated_user_only!, only: :create

  def create
    @fellow = Fellow.where(confirmation_token: params[:confirmation_token]).where(confirmed_at: nil).limit(1).take
    @fellow.confirm! if @fellow
    redirect_to :root, notice: 'Your email is verified..you can login now..'
  end

end
