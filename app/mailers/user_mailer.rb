class UserMailer < ApplicationMailer


  def welcome_email(order)
    @order = order
    @url  = 'http://example.com/login'
    puts "order.user.email #{order.user.email.inspect}"
    mail(to: order.user.email,
         subject: "Order ID:  #{@order.id}")
  end
end
