# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian/contrib-jessie64"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.  The name is required due to a bug with VirtualBox
  config.vm.network "private_network", ip: "192.168.56.50", name: "VirtualBox Host-Only Ethernet Adapter"

  ## Rather than using a synced folder, the Salt files are located in
  ## the default mount provided by Vagrant, and configured in the 'minion' file.

  ## TODO Unfortunately, the base Debian box does not have Salt by default
  ## Vagrant will bootstrap it, but it takes some time

  ## Use defaults for Salt masterless
  config.vm.provision :salt do |salt|

    salt.masterless = true

    # This copies the minion file, which MUST contain the line "file_client: local"
    salt.minion_config = "saltstack/etc/minion"
    salt.run_highstate = true

    # This pillar data is set here for proximity to the relevant data.
    # That is, the Vagrantfile is in the project root, next to the theme's folder.
    salt.pillar({
      "dev_theme_name" => "acdl-theme"
    })

    # As noted on https://github.com/JustinCarmony/vagrant-salt-example ,
    # This is useful for testing, but can be commented once the Salt
    # states have been stabilized.
    salt.verbose = true

    # TODO Research the other options for the Salt task, such as salt.colorize
    
  end

end
