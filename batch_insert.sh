N=100000000
for batch_size in 10000000 1000000 100000 10000 1000 100 10 1
do
num_batches=$(expr $N / $batch_size)
echo batch size =  $batch_size,  num_batches = $num_batches
echo batch_size, num_batches, time >> rma_batch_insert.out
for trial in 1 2 3 4 5 6 7 8 9 10
do 
echo -n $batch_size, $num_batches, >> rma_batch_insert.out
./build/pmacomp -e bulk_loading --initial_size $N --initial_size_uniform --batch_size $batch_size --num_batches $num_batches -d uniform -a btreecc_pma7b -b 65 -l 128 --hugetlb --extent_size 1 -v | grep "batches loaded in:" | cut -f5- -d' ' >> rma_batch_insert.out
done
done
