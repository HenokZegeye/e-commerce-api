require 'jwt'

class TokenAuthService
  AUTH_SECRET = '31a70abfaa57e5e77a3fc9f27aeaaf59b9a9f5355b5e16c842ee172035a8ed40bf82c1c971ecc176e4f0b4c9e6141db07'\
                'fd4a5af3f7db9265e719fbe340b105a'.freeze

  def self.issue(payload)
    JWT.encode(payload, auth_secret, 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, auth_secret, true, algorithm: 'HS256').first
  end

  def self.auth_secret
    AUTH_SECRET
  end
end
