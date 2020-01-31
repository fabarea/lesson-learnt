---
tags:
  - blockchain
  - gridcoin
title: BlockChain - GridCoin
---

https://steemit.com/cryptocurrency/@daut44/gridcoin-setup-guide-for-mac-os-x-part-1

Here is my situation

- I am mining via BoincClient a grcpool.com
- I currently have 134 grc in my wallet
- I have an account in https://boincstats.com/

What shall I do to go solo?

- I have an email address in gridcoinresearch.com (I am using the same email as in boincstats.com) - but that is probably not enough.
- CPID still remains Investor

Todo

Links:
https://gridcoin.science (good!)
http://uscore.net/
https://steemit.com/gridcoin/@sc-steemit/solo-mining-a-guide-trough-magnitude-neural-network-and-beacons
-> send a beatcoin
https://steemit.com/gridcoin/@delordsquest/mining-cryptocurrencies-don-t-repeat-my-mistakes-gridcoin
execute advertisebeacon

## check open project

    https://gridcoin.us/Guides/whitelist.htm <--
    https://gridcoin.io/

## How to setup Boinc in headless mode?

```sh
# Installation
sudo apt install boinc

# Join the bool and add new projects. 
# Execute the first command twice if `sync` is not avaiable.
boinccmd --join_acct_mgr https://www.grcpool.com fab1en <private.note>
boinccmd --acct_mgr sync

# Define the mode "auto" which is smart.
boinccmd --set_run_mode auto

# Get the status. We should see some project in the first section
boinccmd --get_state
boinccmd --get_cc_status (?)

# List of tasks
boinccmd --get_tasks

# Start / stop the service
service boinc-client stop

# Directory where the date is stored
cd /var/lib/boinc-client
```

More commands:

https://boinc.berkeley.edu/wiki/Boinccmd_tool

How to connect  the Boinc local client with a remote Boinc server?
------------------------------------------------------------------

Resources:

https://www.youtube.com/watch?v=RrCsWqr6b1w