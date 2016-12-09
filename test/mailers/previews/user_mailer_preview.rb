class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(Order.includes(line_items: :product).last)
  end
end