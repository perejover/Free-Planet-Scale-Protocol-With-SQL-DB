FROM ghcr.io/perejover/ps-http-sim:latest
CMD ["-listen-port=3900", "-mysql-dbname=dbname", "-mysql-addr=hostname", "-mysql-port=port"]

#mysql://db1_rodrelated:a65d1f80f8595e3bfb513b412f70a30a7214cffc@iw4pm.h.filess.io:3307/db1_rodrelated