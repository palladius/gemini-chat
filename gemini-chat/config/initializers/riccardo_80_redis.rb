
# TODO use Cloudrun replica id to match CRun id to person asking for stuff...
# config.redis = { id: "Sidekiq-server-PID-#{::Process.pid}" }
# config.redis = { url: 'redis://...', network_timeout: 5, pool_timeout: 5 }
# Rails.application.configure do
#   config.redis = { id: "CloudRun-server-PID-#{::Process.pid}" }
# end
# https://gitlab.com/gitlab-org/gitlab/-/merge_requests/75173

if IsCloudRun
  puts("🏃🏻🏃🏻 Cloud Run detected 🏃🏻🏃🏻: Making id=nil as Gitlab friends found out.")
  Rails.application.configure do
    config.redis = { id: nil }

    # config.action_cable.mount_path = nil
    # config.action_cable.url = "wss://example.com/cable"
    # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ]
  end
end
