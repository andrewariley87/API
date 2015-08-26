class TaggingSerializer < ActiveModel::Serializer
  belongs_to :note
  belongs_to :tag
end
