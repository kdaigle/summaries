class User < ActiveRecord::Base

  # Twitter UID.
  # column :uid
  validates :uid, :presence => true, :uniqueness => true

  # Twitter oAuth token.
  # column :token
  validates :token, :presence => true

  # Twitter oAuth secret.
  # column :secret
  validates :secret, :presence => true

  # Twitter nickname.
  # column :nickname
  validates :nickname, :presence => true

  # Twitter full name.
  # column :name
  validates :name, :presence => true

  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_initialize_by_uid(auth_hash[:uid])
    user.token = auth_hash[:credentials][:token]
    user.secret = auth_hash[:credentials][:secret]
    user.nickname = auth_hash[:info][:nickname]
    user.name = auth_hash[:info][:name]
    user.save!
    user
  end

end
