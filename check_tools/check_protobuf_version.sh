echo protobuf installed
whereis protoc
echo default protobuf
which protoc
echo check default protobuf version
protoc --version
echo system protobuf version
/usr/local/bin/protoc --version
echo pip global protobuf version
pip list | grep proto
echo pip local protobuf version
pip list --user | grep proto
echo python protobuf version
python -c "import google.protobuf;print(google.protobuf.__version__)"
