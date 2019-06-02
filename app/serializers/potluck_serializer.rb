class PotluckSerializer < ActiveModel::Serializer
  attributes :id, :name, :date
  belongs_to :organizer, serializer: PotluckOrganizerSerializer
end
