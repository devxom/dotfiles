echo -e "[mongodb-org-3.3]
name=MongoDB Repository
baseurl=http://repo.mongodb.org/yum/redhat/7/mongodb-org/3.3/x86_64/
gpgcheck=0
enabled=1
sudo chkconfig mongod on" >> /etc/yum.repos.d/mongodb.repo

sudo dnf install -y mongodb-org

## LaTeX
# dnf -y groups install "Authoring and Publishing"
# dnf -y install texstudio vim-latex texlive-collection-langcyrillic texlive-t2 texlive-cm-super texlive-textgreek texlive-langcode

## docker
# curl -sSL https://get.docker.com/ | sh

## Disable SELinux
# sed -i '/^SELINUX=/s/enforcing/disabled/' /etc/selinux/config