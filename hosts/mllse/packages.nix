{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Core tools
    git
    vim
    neovim
    curl
    wget
    rsync
    unzip
    zip
    tree
    file

    # Networking / debugging
    inetutils
    dnsutils
    iputils
    tcpdump
    nmap

    # System monitoring
    htop
    btop
    iotop
    lsof
    strace

    # Build / dev essentials
    gcc
    gnumake
    pkg-config

    # Nix helpers
    nixfmt-rfc-style
    nixpkgs-fmt
  ];
}
