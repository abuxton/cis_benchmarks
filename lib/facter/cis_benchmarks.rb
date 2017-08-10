# CIS RHEL7 Benchmarks

require 'facter'

Facter.add('cis_benchmarks') do
	confine :osfamily => 'RedHat'
	setcode do
		cis_benchmarks = {}
			ww_files=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_ww_files.sh')
			ww_dirs=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_ww_dirs.sh')
			yum_updates=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_yumupdates.sh')
			unconfined_daemons=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_unconfined_daemons.sh')
			redhat_network=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_redhat_network.sh')
			redhat_gpg=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_redhat_gpg.sh')
			pw_hash=Facter::Core::Execution.exec('authconfig --test | grep hashing | grep sha512')
			inactive_acct=Facter::Core::Execution.exec("useradd -D | grep INACTIVE | awk -F= {'print $2'}")
			system_acct=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_disable_sys_acct.sh')
			unowned_files=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_unowned_files.sh')
			ungrouped_files=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_ungrouped_files.sh')
			suid_exec=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_suid_exec.sh')
			sgid_exec=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_sgid_exec.sh')
			password_fields=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_password_fields.sh')
			legacy_entry_passwd=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_legacy_entry.sh /etc/passwd')
			legacy_entry_shadow=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_legacy_entry.sh /etc/shadow')
			legacy_entry_group=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_legacy_entry.sh /etc/group')
			uid=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_uid_0.sh')
			dup_uid=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_dup_uid.sh')
			dup_gid=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_dup_gid.sh')
			res_uid=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_res_uid.sh')
			dup_name=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_dup_name.sh')
			dup_group=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_dup_group.sh')
			netrc=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_netrc.sh .netrc')
			forward=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_netrc.sh .forward')
			userhome=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_userhome.sh')
			validhome=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_validhome.sh')
			checkgroup=Facter::Core::Execution.exec('/tmp/cis_scripts/cis_checkgroup.sh')

			# v1.0.0 Rule 1.1.17
			# v2.0.0 Rule
			if ww_dirs
				cis_benchmarks['ww_files'] = ww_files
			end
			if ww_dirs
				cis_benchmarks['ww_dirs'] = ww_dirs
			end

			# v1.0.0 Rule 1.2.1
			# v2.0.0 Rule
			if redhat_network
				cis_benchmarks['redhat_network'] = redhat_network
			end

			# v1.0.0 Rule 1.2.2
			# v2.0.0 Rule
			if redhat_gpg
				cis_benchmarks['redhat_gpg'] = redhat_gpg
			end

			# v1.0.0 Rule 1.2.5
			# v2.0.0 Rule
			if yum_updates
				cis_benchmarks['yum_updates'] = yum_updates
			end
			# v1.0.0 Rule 1.2.6
			# v2.0.0 Rule
			if File.exist?('/etc/.cis_benchmarks_pkg_integrity')
				cis_benchmarks['pck_integrity'] = Facter::Core::Execution.exec('cat /etc/.cis_benchmarks_pkg_integrity')
			end
			# v1.0.0 Rule 1.4.6
			# v2.0.0 Rule
			if unconfined_daemons
				cis_benchmarks['unconfined_daemons'] = unconfined_daemons
			end

			# v1.0.0 Rule 6.3.1
			# v2.0.0 Rule
			if pw_hash
				cis_benchmarks['pw_hash'] = pw_hash
			end

			# v1.0.0 Rule 7.2
			# v2.0.0 Rule
			if system_acct
				cis_benchmarks['system_acct'] = ww_dirs
			end

			# v1.0.0 Rule 7.5
			# v2.0.0 Rule
			if inactive_acct
				cis_benchmarks['inactive_acct'] = inactive_acct
			end

			# v1.0.0 Rule 9.1.11
			# v2.0.0 Rule
			if unowned_files
				cis_benchmarks['unowned_files'] = unowned_files
			end

			# v1.0.0 Rule 9.1.12
			# v2.0.0 Rule
			if ungrouped_files
				cis_benchmarks['ungrouped_files'] = ungrouped_files
			end

			# v1.0.0 Rule 9.1.13
			# v2.0.0 Rule
			if suid_exec
				cis_benchmarks['suid_exec'] = suid_exec
			end

			# v1.0.0 Rule 9.1.14
			# v2.0.0 Rule
			if sgid_exec
				cis_benchmarks['sgid_exec'] = sgid_exec
			end

			# v1.0.0 Rule 9.2.1
			# v2.0.0 Rule
			if password_fields
				cis_benchmarks['password_fields'] = password_fields
			end

			# v1.0.0 Rule 9.2.2
			# v2.0.0 Rule
			if legacy_entry_passwd
				cis_benchmarks['legacy_entry_passwd'] = legacy_entry_passwd
			end

			# v1.0.0 Rule 9.2.2
			# v2.0.0 Rule
			if legacy_entry_shadow
				cis_benchmarks['legacy_entry_shadow'] = legacy_entry_shadow
			end

			# v1.0.0 Rule 9.2.2
			# v2.0.0 Rule
			if legacy_entry_group
				cis_benchmarks['legacy_entry_group'] = legacy_entry_group
			end

			# v1.0.0 Rule 9.2.5
			# v2.0.0 Rule
			if uid
				cis_benchmarks['uid'] = uid
			end


			# v1.0.0 Rule 9.2.11
			# v2.0.0 Rule
			if checkgroup
				cis_benchmarks['checkgroup'] = checkgroup
			end

			# v1.0.0 Rule 9.2.12
			# v2.0.0 Rule
			if validhome
				cis_benchmarks['validhome'] = validhome
			end

			# v1.0.0 Rule 9.2.13
			# v2.0.0 Rule
			if userhome
				cis_benchmarks['userhome'] = userhome
			end

			# v1.0.0 Rule 9.2.14
			# v2.0.0 Rule
			if dup_uid
				cis_benchmarks['dup_uid'] = dup_uid
			end

			# v1.0.0 Rule 9.2.15
			# v2.0.0 Rule
			if dup_gid
				cis_benchmarks['dup_gid'] = dup_gid
			end

			# v1.0.0 Rule 9.2.16
			# v2.0.0 Rule
			if res_uid
				cis_benchmarks['res_uid'] = res_uid
			end

			# v1.0.0 Rule 9.2.17
			# v2.0.0 Rule
			if dup_name
				cis_benchmarks['dup_name'] = dup_name
			end

			# v1.0.0 Rule 9.2.18
			# v2.0.0 Rule
			if dup_group
				cis_benchmarks['dup_group'] = dup_group
			end

			# v1.0.0 Rule 9.2.19
			# v2.0.0 Rule
			if netrc
				cis_benchmarks['netrc'] = netrc
			end

			# v1.0.0 Rule 9.2.20
			# v2.0.0 Rule
			if forward
				cis_benchmarks['forward'] = forward
			end

		cis_benchmarks
	end
end
