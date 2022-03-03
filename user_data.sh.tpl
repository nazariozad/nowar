#!/bin/bash
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "Docker installed"

echo "#!/bin/bash
for i in {1..1000}; do
%{ for host in hosts ~}
        sudo docker run -it alpine/bombardier -c 1000 -d 60s -l ${host} && sleep 5;
%{ endfor ~}
done" > /home/ubuntu/scr.sh

echo "File created"
cat /home/ubuntu/scr.sh

cd /home/ubuntu/
echo $(pwd)

chmod +x /home/ubuntu/scr.sh

echo "Starting..."
sudo -H -u ubuntu bash -c 'screen -d -m /home/ubuntu/scr.sh'
echo "Finished"
