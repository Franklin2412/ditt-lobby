class Fellow < ActiveRecord::Base
  include Authenticable

  has_one :gift

  has_and_belongs_to_many :songs
  has_many :comments

  def valid_for_authentication?(pass = nil, &block)
    result = block_given? ? yield(pass) : false
    return true if result
    false
  end

  def update_fellow params
    if valid_password?(params[:current_password])
      params.delete(:current_password)
      fellow_params = params[:fellow].permit!
      params.delete(:fellow)
      params.delete(:utf8)
      params.delete(:_method)
      params.delete(:authenticity_token)
      params.delete(:current_password)
      params.delete(:commit)
      params.delete(:id)
      params.delete(:action)
      params.delete(:controller)
      gift_params = params.permit!

      transaction do
        self.update_attributes fellow_params
        self.gift.update_attributes gift_params
      end
      true
    else
      false
    end
  end

  before_validation do
    self.confirmation_token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz') if new_record?
  end

  #before_create do
  #  self.build_gift
  #  self.save(validate: false)
  #end

  after_create do
    #send_email through worker
  end

  #after_update do
  #  if email.
  #    self.confirmation_token = SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
  #    #send email.
  #  end
  #end
end
