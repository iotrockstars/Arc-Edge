IDScope=0ne0071A2FD
RegistrationID=lab1
SymmetricKey=ytvx053+IbpczHx0E8HVZW0QH+nN12c/1Q4pcumiAfM1j/gVAXVKJnq61SwrIfb/iFX6C2MV3xpiLvx2R5FHOA==

wget https://github.com/Azure/iot-edge-config/releases/latest/download/azure-iot-edge-installer.sh -O azure-iot-edge-installer.sh \
&& chmod +x azure-iot-edge-installer.sh \
&& sudo -H ./azure-iot-edge-installer.sh -s $IDScope -r $RegistrationID -k $SymmetricKey \
&& rm -rf azure-iot-edge-installer.sh
