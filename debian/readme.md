# Debian

Configuration for simple Debian Virtualbox VM based on Bookworm.

To install Virtualbox additions:

1. Shutdown VM `vagrant halt`
2. Right click VM in GUI: Settings / Storage / Controller
* Right click / Optical Drive / select virtualbox additions
3. Start VM
4. `vagrant ssh`
5. `sudo mount /dev/cdrom /mnt/`
6. `sudo sh /mnt/VBoxLinuxAdditions.run`
7. `exit`
8. `vagrant reload`
9. Reset vagrant password `sudo passwd vagrant`

## Few tips

* Enable audio: Right click VM on GUI / Settings / Audio
    * Enable audio (try default driver)
* Enable 3D acceleration: Right click VM on GUI / Settings / Display
    * Enable 3D acceleration