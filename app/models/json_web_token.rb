class JsonWebToken
  JWT_SECRET_KEY = ENV['JWT_SECRET_KEY']
  class << self
    def encode(payload)
      expiration = 7.days.from_now.to_i
      JWT.encode(payload.merge(exp: expiration), JWT_SECRET_KEY, 'HS256')
    end

    def decode(token)
      JWT.decode(token, JWT_SECRET_KEY, true, algorithm: 'HS256').first
    end
  end
end