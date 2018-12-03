node_number=$(hostname | sed 's/cli//')
sed -i -e 's/0.json/'${node_number}'.json/g' /opt/zoro-cli/config.json
#(cd /opt/zoro-cli/; rm -rf Chain_0* Index_0*)
find /home/data/Zoro-Cli/zoro-cli/bin/Debug/netcoreapp2.0/ -name "*.dll" -exec cp -p {} /opt/zoro-cli/ \;
find /home/data/Zoro-Cli/zoro-cli/bin/Debug/netcoreapp2.0/ -name "*.pdb" -exec cp -p {} /opt/zoro-cli/ \;
find /home/data/Bcp -name "*.dll" -exec cp -p {} /opt/zoro-cli/ \;
find /home/data/Bcp -name "*.pdb" -exec cp -p {} /opt/zoro-cli/ \;
source scl_source enable rh-dotnet20
dotnet /opt/zoro-cli/Zoro-Cli.dll --rpc
