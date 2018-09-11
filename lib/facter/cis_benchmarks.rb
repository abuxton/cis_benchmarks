# CIS Benchmarks
require 'facter'

#override facter: FACTER_fact_temp_dir
Facter.add('fact_temp_dir') do
  confine :osfamily => 'RedHat'
  setcode do
    '/tmp'
  end
end

Facter.add('cis_benchmarks') do
	confine :osfamily => 'RedHat'
	setcode do

        fact_temp_dir = Facter.value(:fact_temp_dir)

		cis_benchmarks = {}

		Facter::Core::Execution.exec("test -d #{fact_temp_dir}/cis_scripts")

        #TODO: If the scripts directory exist then the execution of the bash scripts
        #      can be performed and otherwise the return should and empty cis_benchmarks value
      if $?.exitstatus.eql?(0)

          # redhat v2.1.1 = 6.1.10
          ww_files=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_ww_files.sh")
          # redhat v1.0.0 = , v2.1.1 = 1.1.21
          ww_dirs=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_ww_dirs.sh")
          # redhat v1.0.0 = 1.2.3, v2.1.1 = 1.8
          yum_updates=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_yumupdates.sh")
          # redhat v1.0.0 = 1.4.6, v2.1.1 = 1.6.1.6
          unconfined_daemons=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_unconfined_daemons.sh")
          # redhat v1.0.0 = 1.2.1, v2.1.1 = 1.2.4
          redhat_network=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_redhat_network.sh")
          # redhat v1.0.0 = 1.1.2, v2.1.1 = 1.2.3
          redhat_gpg=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_redhat_gpg.sh")
          # redhat v1.0.0 = 6.3.1
          pw_hash=Facter::Core::Execution.exec('authconfig --test | grep hashing | grep sha512')
          # redhat v1.0.0 = 7.5
          inactive_acct=Facter::Core::Execution.exec("useradd -D | grep INACTIVE | awk -F= {'print $2'}")
          # redhat v1.0.0 = 9.1.10, v2.1.1 = 5.4.2
          system_acct=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_disable_sys_acct.sh")
          # redhat v1.0.0 = 9.1.11, v2.1.1 = 6.1.11
          unowned_files=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_unowned_files.sh")
          # redhat v1.0.0 = 9.1.12 , v2.1.1 = 6.1.12
          ungrouped_files=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_ungrouped_files.sh")
          # redhat v1.0.0 = 9.1.13, v2.1.1 = 6.1.13,
          suid_exec=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_suid_exec.sh")
          # redhat v1.0.0 = 9.1.14, v2.1.1 = 6.1.14
          sgid_exec=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_sgid_exec.sh")
          # redhat v1.0.0 = 9.2.1, v2.1.1 = 6.2.1
          password_fields= Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_password_fields.sh")
          # redhat v1.0.0 = 9.2.2, v2.1.1 = 6.2.2
          legacy_entry_passwd=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_legacy_entry.sh /etc/passwd")
          legacy_entry_shadow=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_legacy_entry.sh /etc/shadow")
          legacy_entry_group=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_legacy_entry.sh /etc/group")
          # redhat v1.0.0 = 9.2.5, v2.1.1 = 6.2.5
          uid=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_uid_0.sh")
          # redhat v1.0.0 = 9.2.14, v2.1.1 = 6.2.16
          dup_uid=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_dup_uid.sh")
          # redhat v1.0.0 = 9.2.15, v2.1.1 = 6.2.17
          dup_gid=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_dup_gid.sh")
          # redhat v1.0.0 = , v2.1.1 =
          res_uid=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_res_uid.sh")
          # redhat v1.0.0 = 9.2.17 , v2.1.1 = 6.2.18
          dup_name=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_dup_name.sh")
          # redhat v1.0.0 =9.2.15 , v2.1.1 = 6.2.17,6.2.19
          dup_group=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_dup_group.sh")
          # redhat v1.0.0 = , v2.1.1 =
          netrc=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_netrc.sh .netrc")
          # redhat v1.0.0 = 9.2.19, v2.1.1 = 6.2.12
          forward=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_netrc.sh .forward")
          # redhat v1.0.0 = 9.2.13, v2.1.1 = 6.2.9
          userhome=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_userhome.sh")
          # redhat v1.0.0 = 9.2.12, v2.1.1 = 6.2.7
          validhome=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_validhome.sh")
          # redhat v1.0.0 = 9.2.11, v2.1.1 = 6.2.15
          checkgroup=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_checkgroup.sh")
          # redhat  v2.1.1 = 6.2.6
          verify_root=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_verify_root_path.sh")
          # redhat v2.1.1 = 6.2.8
          validate_user_homes=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_validate_user_home_perm.sh")
          # redhat v2.1.1 = 6.2.10
          validate_user_dot_files=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_user_dot_files_verified.sh")
          # redhat v2.1.1 = 6.2.14
          user_rhosts=Facter::Core::Execution.exec("#{fact_temp_dir}/cis_scripts/cis_find_user_dot_rhosts.sh")

              if ww_dirs
                  cis_benchmarks['ww_files'] = ww_files
              end
              if ww_dirs
                  cis_benchmarks['ww_dirs'] = ww_dirs
              end
              if redhat_network
                  cis_benchmarks['redhat_network'] = redhat_network
              end
              if redhat_gpg
                  cis_benchmarks['redhat_gpg'] = redhat_gpg
              end
              if yum_updates
                  cis_benchmarks['yum_updates'] = yum_updates
              end
              if File.exist?('/etc/.cis_benchmarks_pkg_integrity')
                  cis_benchmarks['pck_integrity'] = Facter::Core::Execution.exec('cat /etc/.cis_benchmarks_pkg_integrity')
              end
              if unconfined_daemons
                  cis_benchmarks['unconfined_daemons'] = unconfined_daemons
              end
              if pw_hash
                  cis_benchmarks['pw_hash'] = pw_hash
              end
              if system_acct
                  cis_benchmarks['system_acct'] = ww_dirs
              end
              if inactive_acct
                  cis_benchmarks['inactive_acct'] = inactive_acct
              end
              if unowned_files
                  cis_benchmarks['unowned_files'] = unowned_files
              end
              if ungrouped_files
                  cis_benchmarks['ungrouped_files'] = ungrouped_files
              end
              if suid_exec
                  cis_benchmarks['suid_exec'] = suid_exec
              end
              if password_fields
                  cis_benchmarks['password_fields'] = password_fields
              end
              if verify_root
                  cis_benchmarks['verify_root'] = verify_root
              end
              if validate_user_homes
                  cis_benchmarks['validate_user_homes'] = validate_user_homes
              end
              if sgid_exec
                  cis_benchmarks['sgid_exec'] = sgid_exec
              end
              if legacy_entry_passwd
                  cis_benchmarks['legacy_entry_passwd'] = legacy_entry_passwd
              end
              if legacy_entry_shadow
                  cis_benchmarks['legacy_entry_shadow'] = legacy_entry_shadow
              end
              if legacy_entry_group
                  cis_benchmarks['legacy_entry_group'] = legacy_entry_group
              end
              if uid
                  cis_benchmarks['uid'] = uid
              end
              if checkgroup
                  cis_benchmarks['checkgroup'] = checkgroup
              end
              if validhome
                  cis_benchmarks['validhome'] = validhome
              end
              if validate_user_dot_files
                  cis_benchmarks['validate_user_dot_files'] = validate_user_dot_files
              end
              if user_rhosts
                  cis_benchmarks['user_rhosts'] = user_rhosts
              end
              if userhome
                  cis_benchmarks['userhome'] = userhome
              end
              if dup_uid
                  cis_benchmarks['dup_uid'] = dup_uid
              end
              if dup_gid
                  cis_benchmarks['dup_gid'] = dup_gid
              end
              if res_uid
                  cis_benchmarks['res_uid'] = res_uid
              end
              if dup_name
                  cis_benchmarks['dup_name'] = dup_name
              end
              if dup_group
                  cis_benchmarks['dup_group'] = dup_group
              end
              if netrc
                  cis_benchmarks['netrc'] = netrc
              end
              if forward
                  cis_benchmarks['forward'] = forward
              end
	  else
         Facter.warn('Scripts Directory must exist before executing any of the bash scripts')
	  end
        cis_benchmarks
	end
end
