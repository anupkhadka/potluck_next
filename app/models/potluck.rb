class Potluck < ActiveRecord::Base
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  # validations
  validates :name, presence: true
  validates :date, presence: true

end
