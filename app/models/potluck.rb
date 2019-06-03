class Potluck < ActiveRecord::Base
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"
  has_many :items
  has_many :participants, through: :items, source: :user

  # validations
  validates :name, presence: true
  validates :date, presence: true

end
