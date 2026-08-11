{ self, ... }:

{
  flake.modules.nixos.hardening = {
    boot.kernel.sysctl = {
      "kernel.kptr_restrict" = 1;
      "kernel.yama.ptrace_scope" = 1;
      "kernel.unprivileged_bpf_disabled" = 1;
      # "kernel.modules_disabled" = 1;
    };

    security.auditd.enable = true;
    security.audit = {
      enable = "lock";
      rules = [
        "-a always,exit -F arch=b64 -S open,openat -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access_denied"
        "-a always,exit -F arch=b64 -S open,openat -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access_denied"
        "-w /etc/sudoers -p wa -k sudoers_changes"
        "-w /etc/ssh/sshd_config -p wa -k sshd_config"
        "-w /etc/passwd -p wa -k identity"
        "-w /etc/shadow -p wa -k identity"
      ];
      backlogLimit = 8192;
    };
  };

  flake.modules.nixos.common.imports = [
    self.modules.nixos.hardening
  ];
}
