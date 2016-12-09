class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first, Order.includes(line_items: :product).first)
  end
end