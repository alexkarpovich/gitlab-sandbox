.PHONY: init init_firewall install_docker

init: init_firewall install_docker

init_firewall:
	sudo ufw enable && \
	sudo ufw allow https && \
	sudo ufw allow http && \
	sudo ufw allow ssh && \
	sudo ufw reload

install_docker:
	sudo apt-get remove docker docker-engine docker.io containerd runc 2> /dev/null && \
	sudo apt-get update && \
	sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
	sudo mkdir -p /etc/apt/keyrings && \
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
	echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
	sudo apt-get update && \
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	
