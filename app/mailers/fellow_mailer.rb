class FellowMailer < ActionMailer::Base
  default from: "franklin2412@gmail.com"

  def confirm_email(id)
    @fellow = Fellow.find(id)

    mail to: @fellow.email,
         subject: 'Confirm your Ditty lobby account'
  end

end

