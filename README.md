Vagrant boxes by simlun
=======================

[Vagrant][1] is great, but the boxes needs some love:

* Set correct timezone
* Set package repository mirror closer to you
* Upgrade all packages to latest versions
* Make sure VirtualBox Guest Additions are up-to-date

This project is a collection of scripts and Makefiles to achieve this in an
automated and repeatable way.


Dependencies
------------

* [Vagrant][1] (duh..)
* The [vagrant-vbguest][2] plugin: `vagrant plugin install vagrant-vbguest`


Build a box
-----------

    $ cd precise32-simlun
    $ make

Now the latest version of an Ubuntu 12.04 box is added to your local vagrant
cache as `precise32-simlun-latest`. You may also point directly at
`precise32-simlun/dist/precise32-simlun-latest.box` which will always link to
the latest build. Consider putting the boxes you create on a NAS so you may
reach them from your Continuous Integration servers or similar.


[1]: http://www.vagrantup.com/
[2]: https://github.com/dotless-de/vagrant-vbguest
