run! "cd #{config.latest_release} && MIX_ENV=prod mix deps.get && MIX_ENV=prod mix release"


sudo "monit restart phoenix_#{config.app}"
