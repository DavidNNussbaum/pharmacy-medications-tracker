Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, '833063321461-6p4d1rf0mekh4r554dicec92hqggm14a.apps.googleusercontent.com', 'j9DdmA3k3ooiG_087hU3EyRO'
    provider :facebook, '3704681749660053', 'f7f375488e703f4e45480d12b041e76f'
end