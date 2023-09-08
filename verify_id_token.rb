require 'jwt'
require 'open-uri'

jwt = ENV['JWT']

certs = JSON.parse(URI.open("https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com").read)
insecure_id_token = JWT.decode(jwt, nil, false)

id_token = JWT.decode(jwt, nil, true, { algorithm: 'RS256'}) do |headers, payload|
  cert = certs[headers['kid']]
  unless cert.nil?
    OpenSSL::X509::Certificate.new(cert).public_key
  end
end
