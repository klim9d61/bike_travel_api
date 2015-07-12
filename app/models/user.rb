class User < ActiveRecord::Base

  # To configure a different table name:
  # self.table_name = "admin_users"

  has_secure_password

  before_create :set_auth_token

  has_one :contact_information
  belongs_to :role

  def name
    "#{first_name} #{last_name}"
    # Or: first_name + ' ' + last_name
    # Or: [first_name, last_name].join(' ')
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end

  private

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end
end
