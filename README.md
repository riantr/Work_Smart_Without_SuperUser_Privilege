# Be patient. Everything is OK.
## Usage:
1. apt get \<Package\> | grep 'amd64\|all'
2. ./0_debs_list.sh \<PackageName\>
3. ./1_debs_extract.sh
4. ./add_path_before_build.sh
5. cat export_path.need_to_source.$(whoami)>>~/.bashrc
6. source ~/.bashrc
7. ./5_fetch_sources.sh downloaded_bins
8. ./6_build_sources.sh 

## install vim as example
./0_debs_list.sh vim
./1_debs_extract.sh
./add_path_before_build.sh
cat export_path.need_to_source.renyongxiang >> ~/.bashrc
source ~/.bashrc
./5_fetch_sources.sh downloaded_bins
./6_build_sources.sh
cd source/vim
./vim

