# ops_edumeet - PUBLIC iorestoacasa.work

Automation to provision edumeets instances https://wiki.geant.org/display/COV/COVID-19-eduMEET+Home

## Requirements

### Terraforms

require Terraforms for auto provisioning:

```bash
cd /usr/local/bin/
sudo wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
sudo unzip terraform_0.12.24_linux_amd64.zip
sudo rm terraform_0.12.24_linux_amd64.zip
cd -
```

### Ansible >= 2.9

for mm setup. On Ubuntu go with:

```bash
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

Avoid to verify ssh keys for new hosts:

```
echo -e "[defaults]\nhost_key_checking = False" >> ~/.ansible.cfg
```

### Gandi API

```
sudo apt install gandi-cli
gandi setup
```

and fill with your API key


## Go with old good commands...

```bash
terraform init
terraform apply
git clone https://github.com/befair/mm-ansible.git
cp group_vars-mm.yml mm-ansible/group_vars/mm.yml

cd mm-ansible
echo "[mm] > hosts
for n in $(seq 0 1); do
    echo "edumeet-$n.lab.iorestoacasa.work" >> hosts;
    echo "fqdn_host: edumeet-$n" > host_vars/edumeet-$n.lab.iorestoacasa.work.yml
done
python add_dns_records.py
ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts -u root playbook.yml
```


## TODO

* terraform variables: -var="image_id=ami-abc123" -var-file="testing.tfvars" or TF_VARS (https://www.terraform.io/docs/configuration/variables.html#environment-variables)
* get TURN credentials: https://eduturn.org/
* export metrics ;-)


