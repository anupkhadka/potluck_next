class User < ActiveRecord::Base
  has_secure_password
  has_many :organized_potlucks, class_name: "Potluck", foreign_key: "organizer_id"

  # validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def self.find_or_create_by_omniauth(auth_hash)
    user = User.find_or_create_by!(uid: auth_hash['uid']) do |u|
      u.name = auth_hash['info']['name']
      u.password = SecureRandom.hex
    end
    user
  end

end
