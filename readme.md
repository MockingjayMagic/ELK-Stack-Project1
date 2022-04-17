## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Clara Lin - week 12-Page-2 (2)](https://user-images.githubusercontent.com/95038447/163696523-c4bd4511-8d0d-4f37-9fc0-c215b5a8bcdb.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook (.yml) file may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly accessible, in addition to restricting overload to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log data and system metrics.

The configuration details of each machine may be found below.

| Name        | Function                   | IP Address | Operating System |
|-------------|----------------------------|------------|------------------|
| JumpBoxPro2 | Gateway                    | 10.1.0.5   | Linux            |
| Web1        | Web Server - Docker - DVWA | 10.1.0.6   | Linux            |
| Web2        | Web Server - Docker - DVWA | 10.1.0.7   | Linux            |
| Web3-2      | Web Server - Docker - DVWA | 10.1.0.8   | Linux            |
| ELK-VM1     | Peering                    | 10.3.0.6   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
-Personal IP address

Machines within the network can only be accessed by SSH from the Jump Box.

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible    | Allowed IP Addresses                                   |
|-------------|------------------------|--------------------------------------------------------|
| JumpBoxPro2 | No                     | Personal IP Address                                    |
| Web1        | Yes                    | LB IP 20.213.126.194 / JumpBox IP 20.92.78.255         |
| Web2        | Yes                    | LB IP 20.213.126.194 / JumpBox IP 20.92.78.255         |
| Web3-2      | Yes                    | LB IP 20.213.126.194 / JumpBox IP 20.92.78.255         |
| ELK-VM1     | No                     | JumpBox IP 20.92.78.255 / HTTP Port 5601 / Personal IP |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it ensures that we can deploy all the machines at once with the configuration without worrying about human error.

The playbook implements the following tasks:
- increases the max memory amount of the VM to 262144
- installs the apt packages (docker.io and python3-pip) and pip package (docker)
- downloads the docker container (sebp/elk:761) 
- configure the container to start with port mappings as follows for the ELK server to run: 5601:5601, 9200:9200, 5044:5044
- starts up the container and enables docker service on bootup

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![sebp](https://user-images.githubusercontent.com/95038447/163506115-91cc3079-7e3b-484c-ae90-f24ec4b2c4b6.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web1 (10.1.0.6)
- Web2 (10.1.0.7)
- Web3-2 (10.1.0.8)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat helps with collecting data from the system. On the dashboard, one can expect to see syslog events, as well as hostnames and processes. 
- Metricbeat helps with collecting machine metrics. It overlooks the server and gives statistics on CPU usage, memory, file system, and IO services. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml and metricbeat-config.yml file to /etc/ansible/files.
- Update the files to include the ELK-VM1's Private IP address
- Run the playbook, and navigate to http://[ELK-VM1 Public IP]:5601/app/kibana to check that the installation worked as expected.


#### What commands to use?

- ssh azdmin2@20.92.78.255
- sudo su
- docker start gracious_newton 
- docker attach gracious_newton
- cd /etc/ansible
- ansible-playbook elk-playbook.yml
- cd /etc/ansible/files
- ansible-playbook filebeat-playbook.yml
- ansible-playbook metricbeat-playbook.yml

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
