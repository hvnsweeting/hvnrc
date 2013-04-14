#cd /etc/init.d/
#for i in $(ls nova-*);do service $i $1; done
for a in libvirt-bin nova-network nova-compute nova-api nova-objectstore nova-scheduler nova-volume nova-consoleauth nova-cert;do 
    service $a $1;
done
