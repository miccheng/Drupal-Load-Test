# Drupal Load Test

Simple load testing. The final setup are a 2 Apache server web cluster (`drupal-web1.local` and `drupal-web2.local`). They are sharing PHP Sessions via memcached on `drupal-db.local`. MySQL server is running from `drupal-db.local`. The web cluster is load balanced by an Nginx server (`drupaltest.local`). Web requests to Nginx are cached via Varnish.

To gain maximum performance, we turn on Anonymous User caching in Drupal.

The Apache Bench results are included in the `results` folder. The load test was run on 4 VirtualBox Virtual Machines on my Macbook Air (Core i7 with 8 GB RAM - the OS are running on my SSD).

## Installation

1. Install VirtualBox

	Download from [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads). Remember to download the VirtualBox Extension Pack.

2. Install Vagrant
	
	Download from [http://downloads.vagrantup.com](http://downloads.vagrantup.com/).

3. Clone this repo into a local folder and initialize the submodule

	```bash
$ git clone git://github.com/miccheng/Drupal-Load-Test.git drupal_load_test
$ cd drupal_load_test
$ git submodule init
$ git submodule update
```

4. Download Drupal 7

	Download from [Drupal.org](http://drupal.org/download), unzip the file and copy the `drupal` folder into `./projects/`.

5. Start Vagrant

	`cd` into the checked out folder to start the VM:

	```bash
$ vagrant up
```

6. Update your `/etc/hosts` file

	Update your host operating system's `/etc/hosts` file with the following entry:

	```bash
192.168.56.60 drupaltest.localhost
192.168.56.61 drupal-web1.localhost
192.168.56.62 drupal-web2.localhost
192.168.56.63 drupal-db.localhost
```

7. Setup Drupal

	Open your browser to `http://drupaltest.localhost` and run through the setup process. The default passwords are 

## Usage

To login into the VM type
```bash
$ vagrant ssh
```

To stop the VM:
```bash
$ vagrant suspend
```

To halt the VM:
```bash
$ vagrant halt
```

To destroy the VM:
```bash
$ vagrant destroy
```

***Note:*** The MySQL `root` user does not have any password. The Drupal MySQL user is `drupaltest` (Password: `password1`).

## Contacts Details:

*Singapore PHP User Group*<br/>
Facebook Group: https://www.facebook.com/groups/sghypertextpreprocessors/

*Michael Cheng*<br/>
Website: [http://coderkungfu.com](http://coderkungfu.com)<br/>
Twitter: @coderkungfu<br/>
Email: mcheng.work@gmail.com
