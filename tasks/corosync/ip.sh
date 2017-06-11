crm configure primitive FAILOVER-ADDR ocf:heartbeat:IPaddr2 params ip="192.168.80.13" nic="eth0" op monitor interval="5s" meta is-managed="true"
