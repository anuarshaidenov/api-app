class UserSerializer
  include JSONAPI::Serializer
  attributes :fullname, :gender, :email
end
