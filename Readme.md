# High-Interaction Honeypot Setup

## About

This is an enhanced version of TPOT with the following features:

- No click install of TPOT

- Removal of Wordpot and other web honeypots that lead to XSS, reducing risk to all domains and webapps when hosted on an organization's subdomain.

- Addition of custom kibana dashboards that allow easy export of top malware attacker IPs and provide an overall view dashboard.

- Add integration and panel for threat intel. This allows the malware uploaded in dionaea to be checked in our WS3 (Malware lookup API) automatically. This is also presented in a panel to the user.  


## Prerequisites

1. Install Vagrant from the official site, https://developer.hashicorp.com/vagrant/downloads. 

- Please refer to this Installation guide if you face any issues during installation. https://developer.hashicorp.com/vagrant/docs/installation

2. Install Virtualbox from the official site, https://www.virtualbox.org/wiki/Downloads

## Installing the Setup

Download this repository via

```
git clone https://github.com/CSPF-Founder/darwis-tpot.git
```
Or to download it as a zip file, click on `Code` in the top right corner and then select `Download ZIP`.

`cd` into the folder that is created.

### In Linux:

In the project folder run the below command.

```
chmod +x setupvm.sh

./setupvm.sh
```
During the installation and startup, it will ask you to select the bridge adapter interface as shown below:

> **Which interface should the network bridge to?.**

Please enter the corresponding number for the bridge interface option and press `enter`.

Once the vagrant installation is completed, it will automatically restart in Linux. 

### In Windows:

Go to the project folder on the command prompt and then run the below commands.

```
vagrant up
```

During the installation and startup, it will ask you to select the bridge adapter interface as shown below:

> **Which interface should the network bridge to?.**

Please enter the corresponding number for the bridge interface option and press 'enter'.

After it has been completed, run the below command to reload the VM manually.

```
vagrant reload
```

## Accessing the Panel

The Honeypot Panel is available on the URL: https://localhost:64443.

Kibana is available on the URL:
https://localhost:64297.

```
Note: If you want to change the port, you can change the forwardport in the vagrantfile.
```

For information on how to use the panel, please refer to [Manual.md](Manual.md)

## Other info:

- To start the VM after your computer restarts you can give `vargant up` on the project folder or start from the virtualbox manager. 

- To delete the VM, please run `vagrant destroy` in the project folder and press `y` to confirm.

- To rebuild the VM, please follow the below steps:

1. Delete the `Vagrantfile` from the project location.

2. Copy the `Vagrantfile.restore` file and rename the copy to `Vagrantfile`.

3. Run vagrant up in this folder or start the VM from the VirtualBox Manager.

**Note:** Please make sure not to delete the `Vagrantfile.restore` file.

- Once up, you can access the VM by giving the command `vagrant ssh tpot-oss`.


## Contributors

Sabari Selvan

Suriya Prakash

Ragavendra
