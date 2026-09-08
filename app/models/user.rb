class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # admin access
  # admin attribute is a boolean that indicates whether the user has administrative privileges or not. It can be used to restrict access to certain parts of the application or to perform administrative tasks.
  attribute :admin, :boolean, default: false

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # last name to be nullable
  validates :last_name, length: { maximum: 25 }, allow_blank: true

  # name validation
  validates :first_name, :phone_number, presence: true

  generates_token_for :email_confirmation, expires_in: 7.days do
    unconfirmed_email
  end

  def confirm_email
    update(email_address: unconfirmed_email, unconfirmed_email: nil)
  end

  # full name method
  def full_name
    "#{first_name} #{last_name}"
  end
end
