autoreconf -iv
mkdir -p build && cd build
../configure --enable-optimize --disable-debug
make -j
cd -

echo "please follow the instructions about about seeting up huge pages in the README"
echo "the following command smight need to be run with sudo"
echo "echo 4294967296 > /proc/sys/vm/nr_overcommit_hugepages
echo 1 > /proc/sys/vm/overcommit_memory"

N=100000000
for batch_size in 10000000 1000000 100000 10000 1000 100 10 1
do
num_batches=$(expr $N / $batch_size)
echo batch size =  $batch_size,  num_batches = $num_batches
for trial in 1 2 3 4 5 6 7 8 9 10
do 
./build/pmacomp -e bulk_loading --initial_size $N --initial_size_uniform --batch_size $batch_size --num_batches $num_batches -d uniform -a btreecc_pma7b -b 65 -l 128 --hugetlb --extent_size 1 -v | grep "batches loaded in:"
done
done
