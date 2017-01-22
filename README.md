# Systems & Operations

##1.1 – Server Provisioning

Write a Vagrantfile (see https://www.vagrantup.com/) to create a bare Ubuntu 16.04 LTS server with 2 GB of RAM for local use.

Write an Ansible playbook to provision this local server, including:

• The latest security updates.

• Any missing tools you consider crucial for the good operation of a server.

• Any missing tools you consider helpful for the good operation of a server.

• OSRM (see https://github.com/Project-OSRM/osrm-backend), configured with data for Berlin.

Clearly distinguish between which tools you consider crucial and which tools you consider helpful.

## 1.2 – Operations

Consider having to put the trip-routing component above live in a cloud environment, such as Amazon Web Services, on a full planet offload (not just a single city). Describe how you would bring this task to a good
end.

Take into account the following aspects:

• Deployment/Provisioning

• Security

• Scaling

• Operational Procedures

• Monitoring/Alerting

• Anything else you deem important

An overview that covers the major points is better than a detailed handling of a single aspect.



# Solutions

##1.1 – Server Provisioning

![N|Vagrant with Ansible Provisioning](Diagrams/Vagrant_Flow.png)

###Prerequisites

Following Applications are required to be installed for the above task

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
* [Ansible](https://www.ansible.com/)


```sh
$ git clone https://github.com/shahrukhkhan489/Task-Sentiance.git
$ cd Task-Sentiance
$ vagrant up
```

## 1.2 – Operations

![N|AWS Cloud Architecture](Diagrams/Diagram.png)

As seen in the above diagram, the following architecture will be required to put the OSRM trip-routing component live in a cloud environment for full planet offload

To bring the task to a good end following aspects should be taken


#### * Deployment/Provisioning

Building Cloudformation templates should be used to describe the AWS resources and bring up the Entire AWS Infrastructure along with configurations displayed in above diagram.

AWS OpsWorks should be used to Provision the EC2 Instances with Packages etc.

AWS Code Deploy can be used for Continuous Deployment to the EC2 Servers.


#### * Security

As the Component is a public-facing web application, AWS VPC should be used to create the entire architecture in a Private Subnet.

Elastic Load Balancer should be used to Balance the Web Traffic across the EC2 Cluster which will be available to over the public subnet.

Route 53 has to be used for the hosted zone to create resource record sets to tell the Domain Name System how you want traffic to be routed for that domain.


#### * Scaling

Multi-AZ deployments have to be done to enhance availability and durability.

Autoscaling Group has to be defined with a scale out and scale in policy with integration with CloudWatch Alarms.

Elastic Load Balancer has to be integrated With Auto Scaling Group to Balance the Web traffic across all the EC2 instances.

AWS Elastic Cache can be used as it improves the performance of web applications by allowing you to retrieve information from fast, managed, in-memory data stores.


#### * Operational Procedures

For Building the Latest Code of Application Server Stack, a Continuous Integration and Delivery platform can be developed using GitHub, AWS CodePipeline, Jenkins, and AWS Elastic Beanstalk to Build and Release the Packages for every commit. 

For Developemnt and Testing Vagrant platform can be used.


#### * Monitoring/Alerting

AWS CloudWatch should be used to collect and track metrics, collect and monitor log files, set alarms, and automatically react to changes in your AWS resources. 
