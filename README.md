# bortex
![](https://github.com/cloud-jake/bortex/raw/main/img/bort.gif)


[WIP]Banner BigQuery Framework

1 - Determine Connectivity
- IP allowlisting - Access from external networks, not secured
- Forward-SSH tunnel - Access from external networks, encrypted and secured
- Private connectivty (VPC peering) - Access within Google's network or over VPN/Interconnect

We'll use the Forward-SSH tunnel method to get up and running quickly and securely, while sacraficing performance.  While this method could be used in production, Private connectiivty is preferred for the best performance and lower latency.

--diagram of Banner DB with Forward-SSH tunnel--

1A - Create Oracle Test instance in Google Compute Engine (example only - not supported by Oracle licensing)
- no External IP address
- Project external-oracle
- separate instructions? gcp-oracle-test-instance.md

1B - Create Bastion host to enable secure access between the private Oracle Test instance and allowed public networks (Datastream) 
- Project external-oracle
- create Bastion host
- create 2 firewall rules
- separate instructions? gcp-oracle-bastion.md

On Bastion host
- create stream user
- ssh keygen
- add public key to authorized_users
- save private key locally as oracle-bastion.pem


2 - Configure Oracle

2A - Configure Oracle user for Datastream
- create stream user for datastream
- grand permissions for datastream

2B - Configure Oracle Archive Logs
- scripts to run?
- link to Google Support Article



3 - Configure Datastream
3A - Configure Connection Profile for Oracle Server
- Forward-SSH tunnel type
- Oracle username and password
- upload oracle-bastion.pem


