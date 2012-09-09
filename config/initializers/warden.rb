Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :uid
  manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
end