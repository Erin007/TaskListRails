class User < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  validates :email, :uid, :provider, presence: true
  validate :email_at_symbol

  def self.build_from_github(auth_hash)
    user       = User.new
    user.uid   = auth_hash[:uid]
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    return user
  end

  def email_at_symbol
    if self.email != nil
      unless self.email.include?("@")
        errors.add(:email, "Email address must include @")
      end
    end
  end

end
