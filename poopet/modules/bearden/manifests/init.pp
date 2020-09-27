class bearden() {
	# Install sublime
	# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	# sudo apt-get install apt-transport-https

	include bearden::regolith

	# Bunch of pre-reqs for enabling the actual package fetch for third party stuff
	package{['apt-transport-https', 'ca-certificates', 'gnupg', 'curl']:
		ensure	=> installed
	}
	# echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	# sudo apt-get update

	package { ['sublime-text', 'sublime-merge']:
		ensure => installed,
		require	=> Package['apt-transport-https'],
	}
	# sudo apt-get install sublime-text sublime-merge

	# install sublime merge
	# install package control for sublime
	# ? install other sublime stuff I like (vintageous, theme manager, maybe puppet syntax)


	# Install git

	# install docker

	# install and configure regolith

	# set up monitors? probably not but maybe

	# Visual shit

	package{'fonts-inconsolata': ensure=> installed}

	#  1password

	# create docker group
	# add self to docker group

	# install GCP SDK
	# echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list


	# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
	#    ^ requires curl package
	# must apt-get update after the above two, not sure if package will do this automagically but I don't think it will
	package{['google-cloud-sdk', 'kubectl', 'google-cloud-sdk-app-engine-python', 'google-cloud-sdk-app-engine-python-extras', 'google-cloud-sdk-app-engine-go']:
		ensure		=> installed,
		requires	=> Exec[],
	}

	# Terraform with gcp
	# https://github.com/zebrafishlabs/tf-infra-gcp

	# Various and sundry tools

	package { ['yamllint', 'tree', 'virtualbox']:
		ensure => installed,
	}

	# prometheus alert manager
	# Prometheus alertmanager executor
	# ansible :p
	
}
