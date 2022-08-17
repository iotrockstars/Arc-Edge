IDScope=0neXXXXX
RegistrationID=lab1
SymmetricKey=XXXXXXXX

wget https://github.com/Azure/iot-edge-config/releases/latest/download/azure-iot-edge-installer.sh -O azure-iot-edge-installer.sh \
&& chmod +x azure-iot-edge-installer.sh \
&& sudo -H ./azure-iot-edge-installer.sh -s $IDScope -r $RegistrationID -k $SymmetricKey \
&& rm -rf azure-iot-edge-installer.sh
