class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body
  has_many :taggings
  has_many :tags, through: :taggings
end
