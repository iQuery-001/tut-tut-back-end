if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_tut-tut', domain: 'https://tut-tut.netlify.app'
else
  Rails.application.config.session_store :cookie_store, key: '_your-app-name'
end