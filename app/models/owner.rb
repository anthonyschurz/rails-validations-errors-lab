class Owner < ActiveRecord::Base

  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, length: {maximum: 255}

  before_save :normalize_phone_number

  before_save :normalize_phone_number

  validates :first_name,
            presence:   true,
            length:   { maximum: 255 }

  validates :last_name,
            presence:   true,
            length:   { maximum: 255 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            length:     { maximum: 255 }

  def normalize_phone_number
    if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[()-.]/,"")
    end
  end

end
