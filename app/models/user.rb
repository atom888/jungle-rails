class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: true, presence: true, :case_sensitive => false
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true,
            :confirmation =>true,
            length: { in: 3..20 }
  validates_confirmation_of :password


  has_many :orders
  has_many :reviews

  def self.clean_email(email)
    email.strip.downcase if email.present?
  end

  def self.authenticate_with_credentials (email, password)
    email_clean = self.clean_email(email)
    user = self.find_by(email: email_clean)
    if user && user.authenticate(password)
      user
    end
  end




end


