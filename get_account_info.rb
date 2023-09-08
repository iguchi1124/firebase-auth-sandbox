require 'googleauth'
require 'google/apis/identitytoolkit_v3'

identitytoolkit_service = Google::Apis::IdentitytoolkitV3::IdentityToolkitService.new

# https://developers.google.com/identity/protocols/oauth2/scopes
scope = ['https://www.googleapis.com/auth/firebase', 'https://www.googleapis.com/auth/cloud-platform']
authorizer = Google::Auth::ServiceAccountCredentials.from_env(scope: scope)

identitytoolkit_service.authorization = authorizer

uid = ENV['FIREBASE_UID']
request = Google::Apis::IdentitytoolkitV3::GetAccountInfoRequest.new(local_id: [uid], fields: %w(email_verified))
print identitytoolkit_service.get_account_info(request)
