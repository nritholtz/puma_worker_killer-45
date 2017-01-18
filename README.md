# Test application for https://github.com/schneems/puma_worker_killer/issues/45

## To reproduce:
```console
bundle install
bundle exec puma -C config/puma.rb
```

You will see something similar after waiting 20 seconds:
```console
[34684] PumaWorkerKiller: Rolling Restart. 2 workers consuming total: 124.734375 mb out of max:  mb. Sending TERM to pid 34686.
```

Notice the max mb is blank.