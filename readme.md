# Virtual Environments

Configuration for automatic creation of virtual machines (though currently only Debian).

Useful when you want to try out some new technology without messing host system.

Example:
```
cd debian
vagrant up         # Create virtual machine
vagrant ssh        # Connect to virtual machine using SSH
                   # Alternatively, open Virtual Box to connect with GUI (you might need the restart machine once)

vagrant suspend    # Suspend machine: stop machine but save state
vagrant resume     # Resume machine with saved state

vagrant destroy -f # Destroy machine and release resources
```