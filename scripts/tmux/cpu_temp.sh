TEMP=$(sensors -j | jq '."coretemp-isa-0000"."Package id 0".temp1_input')
echo "+$TEMP°C"
