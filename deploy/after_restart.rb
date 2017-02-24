run! "cd #{config.latest_release} && MIX_ENV=prod mix deps.get && MIX_ENV=prod mix release"
run "rsync -avHl #{config.latest_release}/rel #{config.shared}/rel"

sudo "monit restart phoenix_#{config.app}"
