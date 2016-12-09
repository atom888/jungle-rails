class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user, order)
    @user = user
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @user.email,
         subject: "Order ID:  #{@order.id}")
    UserMailer.welcome_email(User.first, Order.includes(line_items: :product).first)
  end
end
