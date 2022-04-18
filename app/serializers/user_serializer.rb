class UserSerializer
  include JSONAPI::Serializer
  attributes :fullname, :gender, :email

  attribute :auth_token do |user, params|
    params[:auth_token]
  end
end
