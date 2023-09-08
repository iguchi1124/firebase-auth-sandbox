require 'googleauth'

token = ENV['JWT']
source = Google::Auth::IDTokens::X509CertHttpKeySource.new("https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com")
verifier = Google::Auth::IDTokens::Verifier.new(key_source: source)
payload = verifier.verify(token)
