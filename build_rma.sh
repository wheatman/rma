autoreconf -iv
mkdir -p build && cd build
../configure --enable-optimize --disable-debug
make -j
cd -

echo "please follow the instructions about about seeting up huge pages in the README"
echo "the following command smight need to be run with sudo"
echo "echo 4294967296 > /proc/sys/vm/nr_overcommit_hugepages
echo 1 > /proc/sys/vm/overcommit_memory"
