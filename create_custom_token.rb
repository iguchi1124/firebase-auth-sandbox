require 'jwt'

service_account_credential_path = ENV['GOOGLE_APPLICATION_CREDENTIALS']
service_account_credential = JSON.parse(File.read(service_account_credential_path))
iss = service_account_credential['client_email']
sub = service_account_credential['client_email']
aud = 'https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.IdentityToolkit'
iat = Time.now.to_i
exp = iat + 3600
uid = ENV['FIREBASE_UID']
pkey = OpenSSL::PKey::RSA.new(service_account_credential["private_key"])
alg = "RS256"

token = JWT.encode({iss: iss, aud: aud, iat: iat, exp: exp, sub: sub, uid: uid}, pkey, alg)
