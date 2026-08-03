{
  boot.kernel.sysctl = {
    "kernel.kptr_restrict" = 1; # hide kernel pointers from exploits
    "kernel.yama.ptrace_scope" = 1; # restrict process tracing
    "kernel.unprivileged_bpf_disabled" = 1; # block unprivileged BPF
    # "kernel.modules_disabled" = 1; # Blocks module loading after boot process is done
  };

  security.auditd.enable = true;
  security.audit = {
    enable = "lock";
    rules = [
      # only log access denied events from real users (uid >= 1000)
      "-a always,exit -F arch=b64 -S open,openat -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access_denied"
      "-a always,exit -F arch=b64 -S open,openat -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access_denied"
      # watch critical config files
      "-w /etc/sudoers -p wa -k sudoers_changes"
      "-w /etc/ssh/sshd_config -p wa -k sshd_config"
      "-w /etc/passwd -p wa -k identity"
      "-w /etc/shadow -p wa -k identity"
      # watch your nixos config (adjust path for your setup)
      "-w /persist/nixos-config/ -p wa -k nixos_config"
    ];
    backlogLimit = 8192;
  };
}
