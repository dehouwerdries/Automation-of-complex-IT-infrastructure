# Weekly Status Report

**Project:** The Lab 2021 - 2022: Automation of Complex IT Infrastructures

**Team:** Goeie Vraag

**Week:** 3 (21/FEB/2022 - 27/FEB/2022)

## Time Registration

**Note:** The time table includes the vacation (28/FEB/2022 to 6/MAR/2022)

|Date                 |Person|Duration |Description                                                                                                                                                                                    |
|---------------------|------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|Mon, 21 February 2022|Lenny |6 hours  |Setting up AD server + sprint review + setting up proper issues in GitLab + StackStorm POC brainstorming + trying out JIRA integration                                                         |
|Mon, 21 February 2022|Arno  |6 hours  |Working on stackstorm deployment onto vm with Terraform and Ansible + brainstorming about Stackstorm POC + trying out Nagios integration                                                       |
|Mon, 21 February 2022|Dries |6 hours  |Almost done with Ansible vs Terraform: ansible playbooks, had some issues but fixed most of them. Need to finish testing later, waiting on propagation of ssh metadata.                        |
|Mon, 21 February 2022|Zehra |5 hours  |Reading more about StackStorm + brainstorming StackStorm POC + sprint review                                                                                                                   |
|Tue, 22 February 2022|Arno  |2,5 hours|Finishing Stackstorm deployment with Terraform & going through stackstorm quick start                                                                                                          |
|Tue, 22 February 2022|Dries |3 hours  |Finished stackstorm quick start guide. Finished Ansible vs Terraform ansible playbooks, started writing this part in the paper, will finish it tomorrow.                                       |
|Tue, 22 February 2022|Zehra |1 hours  |StackStorm quick start                                                                                                                                                                         |
|Wed, 23 February 2022|Dries |3 hours  |Finished Ansible vs Terraform, added extra info in the event-driven part of the paper, removed redundant part. Working on Stackstorm integration with Active Directory.                        |
|Wed, 23 February 2022|Lenny |3 hours  |Finishing Stackstorm QS + setting up JIRA Integration + creating some more GitLab issues                                                                                                       |
|Wed, 23 February 2022|Arno  |4 hours  |Finished Ansible vs Terraform , deployed local nagios instance and seeing how nagios integration with stackstorm works                                                                         |
|Wed, 23 February 2022|Zehra |3 hours  | Looking into Mailgun and sending mails with event + Reading documentation of Actions and configs +                                                                                            |
|Thu, 24 February 2022|Arno  |1 hour   |Finished nagios integration into stackstorm                                                                                                                                                    |
|Fri, 25 February 2022|Lenny |4 hours  |Working on POC 1                                                                                                                                                                               |
|Fri, 25 February 2022|Zehra |4 hours  |Trying to figure out gitlab integration                                                                                                                                                        |
|Fri, 25 February 2022|Dries |3,5 hours|AD setup and StackStorm integration                                                                                                                                                            |
|Sun, 27 February 2022|Dries |1 hour   |POC brainstorm                                                                                                                                                                                 |
|Sun, 27 February 2022|Zehra |1 hour   |POC brainstorm                                                                                                                                                                                 |
|Sun, 27 February 2022|Lenny |1 hour   |POC brainstorm                                                                                                                                                                                 |
|Sun, 27 February 2022|Arno  |1 hour   |POC brainstorm                                                                                                                                                                                 |
|Sun, 27 February 2022|Dries |4,5 hours|Puppet: deploy .net app: added installation of puppetserver, puppetclient                                                                                                                      |
|Mon, 28 February 2022|Arno  |1 hour   |Setting up twitter developer portal + researching titter stackstorm integration                                                                                                                |
|Mon, 28 February 2022|Lenny |1 hour   |Checking out workflow engine                                                                                                                                                                   |
|Mon, 28 February 2022|Dries |4 hours  |Puppet: deploy .net app: fixed certificates                                                                                                                                                    |
|Tue, 1 March 2022    |Arno  |1,5 hours|Making my own custom nagios docker image because the ones on dockerhub where outdated or incomplete                                                                                            |
|Tue, 1 March 2022    |Dries |5,5 hours|Puppet: deploy .net app: working on manifest file that deploys the .NET app                                                                                                                    |
|Tue, 1 March 2022    |Dries |2 hours  |Puppet: deploy .net app: fixing manifest errors                                                                                                                                                |
|Wed, 2 March 2022    |Dries |1 hour   |Puppet: deploy .net app: fixing manifest errors                                                                                                                                                |
|Thu, 3 March 2022    |Dries |2 hours  |Puppet: deploy .net app: docker image gets build, problem with running the image                                                                                                               |
|Fri, 4 March 2022    |Arno  |2,5 hours|having some problems with the apache and nagios service not starting on booting the image & sucsesfully checking services with nagios, Researching the way to add hosts and services to monitor|
|Sun, 6 March 2022    |Zehra |2 hours  |POC brainstorm                                                                                                                                                                                 |

## Status
We've begun on our Proof of Concepts. There were some issues, particularly with Apache and Nagios, but those were solved and aren't a risk to the project whatsoever. We have a StackStorm and AD server up and going.
