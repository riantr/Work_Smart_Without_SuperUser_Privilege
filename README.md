# Be patient. Everything is OK.
## Usage:
1. apt get \<Package\> | grep 'amd64\|all'
2. ./0_debs_list.sh \<PackageName\>
3. ./1_debs_extract.sh
4. ./add_path_before_build.sh
5. cat export_path.need_to_source.$(whoami)>>~/.bashrc
6. source ~/.bashrc
7. ./5_catch_sources.sh \<PackageName\>
8. ./6_build_sources.sh \<PackageName\>
