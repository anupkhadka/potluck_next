class User < ActiveRecord::Base
  has_secure_password
  has_many :organized_potlucks, class_name: "Potluck", foreign_key: "organizer_id"
end
