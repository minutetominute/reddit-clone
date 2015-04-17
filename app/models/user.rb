class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  after_initialize :ensure_session_token

  has_many :posts, foreign_key: :author_id

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    if user
      user.is_password?(password) ? user : nil
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= self.reset_session_token!
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save! unless self.id.nil?
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end