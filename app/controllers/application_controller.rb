class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_controller, :fellow_signed_in?, :current_fellow

  def authenticate_fellow!
    redirect_to :root, notice: 'Please log in to continue..' if !fellow_signed_in?
  end

  def unauthenticated_fellow_only!
    redirect_to current_fellow if fellow_signed_in?
  end

  def current_controller
    params[:controller]
  end

  def set_layout
    if user_signed_in?
      'application'
    else
      'guest'
    end
  end

  def fellow_signed_in?
    !session[:fellow].nil?
  end

  def current_fellow
    @current_fellow ||= Fellow.find(session[:fellow])
  end

  def reset_user
    @current_fellow = nil
  end

  def can_make_song?
    redirect_to songs_path, notice: 'You can contribute to these songs' if !current_fellow.gift.song_writer?
  end


end
