node_number=$(hostname | sed 's/cli//')
find /home/data/wallet -name protocol.json -exec cp -p {} /opt/zoro-cli/ \;
find /home/data/wallet -name protocol.json -exec cp -p {} /opt/zoro-cli/protocol.local.json \;
sed -i -e 's/0.json/'${node_number}'.json/g' /opt/zoro-cli/config.json
sed -i -e 's/123456/123/g' /opt/zoro-cli/config.json
(cd /opt/zoro-cli/; rm -rf Chain_0* Index_0*)
(cd /; rm -rf Chain_0* Index_0*)
ls /opt/zoro-cli/Chain* /opt/zoro-cli/*.json
cat /opt/zoro-cli/protocol.json
find /home/data/Zoro-Cli/zoro-cli/bin/Debug/netcoreapp2.0/ -name "*.dll" -exec cp -p {} /opt/zoro-cli/ \;
find /home/data/Zoro-Cli/zoro-cli/bin/Debug/netcoreapp2.0/ -name "*.pdb" -exec cp -p {} /opt/zoro-cli/ \;
find /home/data/Bcp -name "*" -type f -exec cp -p {} /opt/zoro-cli/ \;
cp -p /home/data/Zoro-Plugins/ApplicationLogs/bin/Debug/netstandard2.0/*.dll /home/data/Plugins
cp -p /home/data/Zoro-Plugins/ApplicationLogs/bin/Debug/netstandard2.0/*.pdb /home/data/Plugins
cp -p /home/data/Zoro-Plugins/ApplicationLogs/bin/Debug/netstandard2.0/ApplicationLogs/* /home/data/Plugins/ApplicationLogs
cp -p /home/data/Zoro-Plugins/SimplePolicy/bin/Debug/netstandard2.0/*.dll /home/data/Plugins 
cp -p /home/data/Zoro-Plugins/SimplePolicy/bin/Debug/netstandard2.0/*.pdb /home/data/Plugins 
cp -p /home/data/Zoro-Plugins/SimplePolicy/bin/Debug/netstandard2.0/SimplePolicy/* /home/data/Plugins/SimplePolicy
yes | cp -rf /home/data/Plugins /opt/zoro-cli/ 
yes | cp -rf /home/data/NeoVM/Neo.VM.dll /opt/zoro-cli/
source scl_source enable rh-dotnet20
(cd /opt/zoro-cli/; dotnet Zoro-Cli.dll --rpc)
