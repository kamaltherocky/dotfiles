

## Create the needed directory structure

mkdir -p ~/code/github.com/kmuralidharan
mkdir -p ~/code/github.com/andromeda-security

sudo scutil --set HostName optimusprime
sudo scutil --set ComputerName optimusprime
dscacheutil -flushcache

FILE="/Users/kamal/.ssh/id_ed25519"
if [ ! -f "$FILE" ]; then
    ssh-keygen -f $FILE -t ed25519 -C `hostname`
fi