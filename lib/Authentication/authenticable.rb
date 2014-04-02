require 'bcrypt'
module Authenticable
  extend ActiveSupport::Concern

  mattr_accessor :pepper
  @@pepper = '715941a418f1858a301ac96b7e3904735d9c1ed00170f5d44fea755ad3bc174dab5fdf45c3ebaeeff9462049a9f9595ecccd21de3e1d195f784553a67f16a52a'

  mattr_accessor :stretches
  @@stretches = 10

  included do

    attr_reader :password, :current_password
    attr_accessor :password_confirmation

    validates_presence_of     :password
    validates_confirmation_of :password,  message: 'should match confirmation'

  end

  # Set password and password confirmation to nil
  def clean_up_passwords
    self.password = self.password_confirmation = nil
  end


  def password=(new_password)
    @password = new_password
    self.encrypted_password = password_digest(@password) if @password.present?
  end

  def password_digest(password)
    ::BCrypt::Password.create("#{password}#{@@pepper}", :cost => @@stretches).to_s
  end

  def valid_password?(password)
    return false if encrypted_password.blank?
    bcrypt   = ::BCrypt::Password.new(encrypted_password)
    password = ::BCrypt::Engine.hash_secret("#{password}#{@@pepper}", bcrypt.salt)
    secure_compare(password, encrypted_password)
  end

  # constant-time comparison algorithm to prevent timing attacks
  def secure_compare(a, b)
    return false if a.blank? || b.blank? || a.bytesize != b.bytesize
    l = a.unpack "C#{a.bytesize}"

    res = 0
    b.each_byte { |byte| res |= byte ^ l.shift }
    res == 0
  end

  def confirm!
    self.confirmed_at = Time.now
    self.confirmation_token = nil
    save(validate: false)
  end

  def confirmed?
    return true if self.confirmed_at.present? && self.confirmation_token.nil?
    false
  end

end