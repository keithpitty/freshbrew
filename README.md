freshbrew
=========

A simple rake task to keep [homebrew](https://github.com/Homebrew/homebrew) up to date.

**Usage:** `rake brew:refresh`

Recommended to be used via a shell script and a cron job as follows.

**Shell script** (e.g. `freshbrew.sh`):

```
#!/bin/bash
. $HOME/.bashrc
cd path/to/freshbrew
rake brew:refresh
```

**Crontab:**

`0 22 * * * /path/to/freshbrew.sh >> /path/to/tmp/out 2>&1`
