class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :pic_url
end