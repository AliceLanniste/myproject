LSM就是`Log structured Merge`的简称，`lsm算法`是为了提高写操作的吞吐量，经过研究发现顺序的写比随机的写磁盘更快。
因此把数据写入文件，比如日志，因为日志是按照时间顺序排列的，


lsm的具体流程是把写操作程序写入到memtable中，当memtable达到一定量的时候，便刷新到磁盘生成小段sstable,生成的sstable不可变并且顺序排列，因为sstable不可变，但会用很多重复的操作，因此生成sstable达到一定数量时会不断合并消除冗余。期间通过`wal`把数据存储，当数据丢失可以从`wal`中备份。
读操作，首先从`memtable`中去找key，如果没找到则在`sstable`中找。