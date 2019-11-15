class PictureSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_one :album
  has_one :location
end
