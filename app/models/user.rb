class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #register inline callback
  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }
  # #validation func ensures name is present, max and min length
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  # #validates password
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  # #validate email is present, unique, case insensitive, proper length
  validates :email,
  presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 254 }

  # #sets and authenticates password
  has_secure_password
  # enum roles added
  enum role: [:member, :admin]

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  # closes class  
end
