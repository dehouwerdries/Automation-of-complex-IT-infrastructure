# .NET app deployment
## How to run
Deploy a .NET 3.1 app using Chef, VMware Desktop and Vagrant. Deploy the app using the following command:

    vagrant up

Delete everything with the following command:

    vagrant destroy -f

Note: 
- Virtualbox is the default Vagrant provider. 
- The .NET webapp can be found on http://localhost:80

## Prerequisites
Install the following software:
    1. Vagrant
    2. [Vagrant VMware Utility](https://www.vagrantup.com/docs/providers/vmware/vagrant-vmware-utility)
    3. Vagrant VMware plugin: <code>vagrant plugin install vagrant-vmware-desktop</code>
    
Note: Virtualbox can also be used as the default provider.