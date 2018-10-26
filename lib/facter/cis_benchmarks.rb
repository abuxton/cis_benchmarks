# CIS Benchmarks
require 'facter'
require 'json'

def script_exec(command_line)
  command = command_line.split(' ')[0]
  if File.exist?(command)
    Facter::Core::Execution.execute(command_line)
  end
end

Facter.add('cis_benchmarks') do
  confine :osfamily => 'RedHat'

  setcode do
    cis_benchmarks = {}

    # redhat v2.1.1 = 6.1.10
    ww_files = script_exec('/tmp/cis_scripts/cis_ww_files.sh')

    # redhat v1.0.0 = , v2.1.1 = 1.1.21
    ww_dirs = script_exec('/tmp/cis_scripts/cis_ww_dirs.sh')

    # redhat v1.0.0 = 1.2.3, v2.1.1 = 1.8
    yum_updates = script_exec('/tmp/cis_scripts/cis_yumupdates.sh')

    # redhat v1.0.0 = 1.4.6, v2.1.1 = 1.6.1.6
    unconfined_daemons = script_exec('/tmp/cis_scripts/cis_unconfined_daemons.sh')

    # redhat v1.0.0 = 1.2.1, v2.1.1 = 1.2.4
    redhat_network = script_exec('/tmp/cis_scripts/cis_redhat_network.sh')

    # redhat v1.0.0 = 1.1.2, v2.1.1 = 1.2.3
    redhat_gpg = script_exec('/tmp/cis_scripts/cis_redhat_gpg.sh')

    # redhat v1.0.0 = 6.3.1
    pw_hash = Facter::Core::Execution.execute('authconfig --test | grep hashing | grep sha512')

    # redhat v1.0.0 = 7.5
    inactive_acct = Facter::Core::Execution.execute("useradd -D | grep INACTIVE | awk -F= {'print $2'}")

    # redhat v1.0.0 = 9.1.10, v2.1.1 = 5.4.2
    system_acct = script_exec('/tmp/cis_scripts/cis_disable_sys_acct.sh')

    # redhat v1.0.0 = 9.1.11, v2.1.1 = 6.1.11
    unowned_files = script_exec('/tmp/cis_scripts/cis_unowned_files.sh')

    # redhat v1.0.0 = 9.1.12 , v2.1.1 = 6.1.12
    ungrouped_files = script_exec('/tmp/cis_scripts/cis_ungrouped_files.sh')

    # redhat v1.0.0 = 9.1.13, v2.1.1 = 6.1.13,
    suid_exec = script_exec('/tmp/cis_scripts/cis_suid_exec.sh')

    # redhat v1.0.0 = 9.1.14, v2.1.1 = 6.1.14
    sgid_exec = script_exec('/tmp/cis_scripts/cis_sgid_exec.sh')

    # redhat v1.0.0 = 9.2.1, v2.1.1 = 6.2.1
    password_fields = script_exec('/tmp/cis_scripts/cis_password_fields.sh')

    # redhat v1.0.0 = 9.2.2, v2.1.1 = 6.2.2
    legacy_entry_passwd = script_exec('/tmp/cis_scripts/cis_legacy_entry.sh /etc/passwd')
    legacy_entry_shadow = script_exec('/tmp/cis_scripts/cis_legacy_entry.sh /etc/shadow')
    legacy_entry_group = script_exec('/tmp/cis_scripts/cis_legacy_entry.sh /etc/group')

    # redhat v1.0.0 = 9.2.5, v2.1.1 = 6.2.5
    uid = script_exec('/tmp/cis_scripts/cis_uid_0.sh')

    # redhat v1.0.0 = 9.2.14, v2.1.1 = 6.2.16
    dup_uid = script_exec('/tmp/cis_scripts/cis_dup_uid.sh')

    # redhat v1.0.0 = 9.2.15, v2.1.1 = 6.2.17
    dup_gid = script_exec('/tmp/cis_scripts/cis_dup_gid.sh')

    # redhat v1.0.0 = , v2.1.1 =
    res_uid = script_exec('/tmp/cis_scripts/cis_res_uid.sh')

    # redhat v1.0.0 = 9.2.17 , v2.1.1 = 6.2.18
    dup_name = script_exec('/tmp/cis_scripts/cis_dup_name.sh')

    # redhat v1.0.0 =9.2.15 , v2.1.1 = 6.2.17,6.2.19
    dup_group = script_exec('/tmp/cis_scripts/cis_dup_group.sh')

    # redhat v1.0.0 = , v2.1.1 =
    netrc = script_exec('/tmp/cis_scripts/cis_netrc.sh .netrc')

    # redhat v1.0.0 = 9.2.19, v2.1.1 = 6.2.12
    forward = script_exec('/tmp/cis_scripts/cis_netrc.sh .forward')

    # redhat v1.0.0 = 9.2.13, v2.1.1 = 6.2.9
    userhome = script_exec('/tmp/cis_scripts/cis_userhome.sh')

    # redhat v1.0.0 = 9.2.12, v2.1.1 = 6.2.7

    validhome = script_exec('/tmp/cis_scripts/cis_validhome.sh')
    # redhat v1.0.0 = 9.2.11, v2.1.1 = 6.2.15

    checkgroup = script_exec('/tmp/cis_scripts/cis_checkgroup.sh')
    # redhat  v2.1.1 = 6.2.6

    verify_root = script_exec('/tmp/cis_scripts/cis_verify_root_path.sh')
    # redhat v2.1.1 = 6.2.8

    validate_user_homes = script_exec('/tmp/cis_scripts/cis_validate_user_home_perm.sh')

    # redhat v2.1.1 = 6.2.10
    validate_user_dot_files = script_exec('/tmp/cis_scripts/cis_user_dot_files_verified.sh')

    # redhat v2.1.1 = 6.2.14
    user_rhosts = script_exec('/tmp/cis_scripts/cis_find_user_dot_rhosts.sh')

    if File.exist?('/etc/.cis_benchmarks_pkg_integrity')
      pkg_integrity = Facter::Core::Execution.execute('cat /etc/.cis_benchmarks_pkg_integrity')
    end

    cis_benchmarks['ww_files'] = ww_files if ww_files
    cis_benchmarks['ww_dirs'] = ww_dirs if ww_dirs
    cis_benchmarks['redhat_network'] = redhat_network if redhat_network
    cis_benchmarks['redhat_gpg'] = redhat_gpg if redhat_gpg
    cis_benchmarks['yum_updates'] = yum_updates if yum_updates
    cis_benchmarks['pck_integrity'] = pkg_integrity if pkg_integrity
    cis_benchmarks['unconfined_daemons'] = unconfined_daemons if unconfined_daemons
    cis_benchmarks['pw_hash'] = pw_hash if pw_hash
    cis_benchmarks['system_acct'] = system_acct if system_acct
    cis_benchmarks['inactive_acct'] = inactive_acct if inactive_acct
    cis_benchmarks['unowned_files'] = unowned_files if unowned_files
    cis_benchmarks['ungrouped_files'] = ungrouped_files if ungrouped_files
    cis_benchmarks['suid_exec'] = suid_exec if suid_exec
    cis_benchmarks['password_fields'] = password_fields if password_fields
    cis_benchmarks['verify_root'] = verify_root if verify_root
    cis_benchmarks['validate_user_homes'] = validate_user_homes if validate_user_homes
    cis_benchmarks['sgid_exec'] = sgid_exec if sgid_exec
    cis_benchmarks['password_fields'] = password_fields if password_fields
    cis_benchmarks['legacy_entry_passwd'] = legacy_entry_passwd if legacy_entry_passwd
    cis_benchmarks['legacy_entry_shadow'] = legacy_entry_shadow if legacy_entry_shadow
    cis_benchmarks['legacy_entry_group'] = legacy_entry_group if legacy_entry_group
    cis_benchmarks['uid'] = uid if uid
    cis_benchmarks['checkgroup'] = checkgroup if checkgroup
    cis_benchmarks['validhome'] = validhome if validhome
    cis_benchmarks['validate_user_dot_files'] = validate_user_dot_files if validate_user_dot_files
    cis_benchmarks['user_rhosts'] = user_rhosts if user_rhosts
    cis_benchmarks['userhome'] = userhome if userhome
    cis_benchmarks['dup_uid'] = dup_uid if dup_uid
    cis_benchmarks['dup_gid'] = dup_gid if dup_gid
    cis_benchmarks['res_uid'] = res_uid if res_uid
    cis_benchmarks['dup_name'] = dup_name if dup_name
    cis_benchmarks['dup_group'] = dup_group if dup_name
    cis_benchmarks['netrc'] = netrc if netrc
    cis_benchmarks['forward'] = forward if forward

    cis_benchmarks.merge(cis_benchmarks) { |key, value| value.force_encoding('ISO-8859-1').encode('UTF-8') }
  end
end
