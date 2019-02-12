#!/bin/bash
set -m

kudu-master -logtostderr \
    -fs_wal_dir /var/lib/kudu/master \
    -fs_data_dirs=/var/lib/kudu/master \
    -use_hybrid_clock=false &

sleep 5

kudu-tserver -logtostderr \
    -tserver_master_addrs 127.0.0.1 \
    -fs_wal_dir /var/lib/kudu/tserver \
    -fs_data_dirs=/var/lib/kudu/tserver \
    -use_hybrid_clock=false &

fg %1
