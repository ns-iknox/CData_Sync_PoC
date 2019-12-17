# CData_Sync_PoC
Quick docker setup for CData Sync PoC

###Important note!
In order to correctly clone this repo you _must_ have [gitLFS installed](https://git-lfs.github.com/)!
* install gitLFS `brew install git-lfs`
* initialize git-lfs hooks for your user (modifies `~/.gitconfig`) `git lfs install`


Then, from the root directory:
* run `build.sh`
* run `run.sh`
* Point your browser to http://localhost:8080 and login (user:admin pass: admin)

`clean.sh` removes all containers and images associated with CData Sync
