## to test all the rules
## vagrant test
#for i in `ls /etc/puppetlabs/code/modules/cis_benchmarks/manifests/redhat7/rule/v_2_1_1/|sed s/.pp//g`; do puppet apply -e "class { cis_benchmarks: exec_controls=>{'$i'=>true}}" --modulepath=$(puppet config print modulepath) --noop |& tee /vagrant/tmp/tests/$i.txt && cat /vagrant/manifests/redhat7/rule/v_2_1_1/$i.pp >> /vagrant/tmp/tests/$i.txt;done

## centos or rhel host test
for i in `ls /etc/puppetlabs/code/modules/cis_benchmarks/manifests/redhat7/rule/v_2_1_1/|sed s/.pp//g`; do puppet apply -e "class { cis_benchmarks: exec_controls=>{'$i'=>true}}" --modulepath=$(puppet config print modulepath) --noop |& tee /tmp/cis_benchmarks_tests_v_2_1_1/$i.txt && cat /etc/puppetlabs/code/modules/cis_benchmarks/manifests/redhat7/rule/v_2_1_1/$i.pp >> /tmp/cis_benchmarks_tests_v_2_1_1/$i.txt;done

## to test a single rulesingle rule
#export rule
#puppet apply -e 'class { cis_benchmarks: exec_controls=>{"$rule"=> true},}' modulepath=$(puppet config print modulepath) |& tee /vagrant/tmp/tests/$rule.txt && cat /vagrant/manifests/redhat7/rule/v_2_1_1/$rule.pp >> /vagrant/tmp/tests/$rule.txt
