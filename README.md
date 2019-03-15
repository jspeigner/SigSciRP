# DockerReverseProxySelfSigned
## Signal Sciences Docker Configuration - ubuntu:xenial SigSci Reverse Proxy

This is a dockerized SigSci reverse proxy agent. The agent configuration is in contrib/agent.conf. You will need to set your agent key and upstream target for requests to be forwarded. The agent is listening for HTTPS on port 443 and using a self-signed certificate. Edit your local hosts file to send requests for various FQDNs to the reverse proxy container. You will get certificate warnings that you should ignore because of the self-signed certificate.

The container allows you to test various sites without the need to install SigSci in the target environment. It is for testing purposes only.  Do not send attacks to production sites without first obtaining permission.

You can use this pre-built container or build your own. There is no web server in this container. It is set up to run only the SigSci reverse proxy agent that will forward traffic to a separate server/container or perhaps to a load balancer that will distribute the traffic.

## Information about the files


**start.sh**
The start.sh is a simple script that starts up the SigSci agent.

**contrib**

_Files:_

````
    contrib/sigsci-release.list  #adds the SigSci package repository
    contrib/agent.conf  #SigSci agent configuration
    contrib/server.crt  #self-signed certificate
    contrib/server.key  #self-signed certificate key
````


I'll usually create a .dockerignore file that will ignore adding the contrib to the final docker container and put files that I would like to copy into the container in this folder.

**Dockerfile**
The included dockerfile is my example for creating a container that has our Signal Sciences Reverse Proxy Agent.

**Makefile**
I tend to prefer nice easy command for doing my tasks in building, deploying, and testing locally. The makefile simplifies this process but is not necessary. Refer to that file for how to build and run the container if you choose to not use the Makefile.
