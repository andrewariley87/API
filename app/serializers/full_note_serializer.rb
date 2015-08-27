class FullNoteSerializer < ActiveModel::Serializer
  attributes :name
  has_many :notes
end
