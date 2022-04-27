{
    "_ansible_facts_gathered": true,
    "ansible_all_ipv4_addresses": [
        "10.0.9.88"
    ],
    "ansible_all_ipv6_addresses": [
        "fe80::886:38ff:fe52:1615"
    ],
    "ansible_apparmor": {
        "status": "disabled"
    },
    "ansible_architecture": "x86_64",
    "ansible_bios_date": "08/24/2006",
    "ansible_bios_vendor": "Xen",
    "ansible_bios_version": "4.2.amazon",
    "ansible_board_asset_tag": "NA",
    "ansible_board_name": "NA",
    "ansible_board_serial": "NA",
    "ansible_board_vendor": "NA",
    "ansible_board_version": "NA",
    "ansible_chassis_asset_tag": "NA",
    "ansible_chassis_serial": "NA",
    "ansible_chassis_vendor": "Xen",
    "ansible_chassis_version": "NA",
    "ansible_cmdline": {
        "BOOT_IMAGE": "/boot/vmlinuz-5.10.109-104.500.amzn2.x86_64",
        "biosdevname": "0",
        "console": "ttyS0,115200n8",
        "net.ifnames": "0",
        "nvme_core.io_timeout": "4294967295",
        "rd.emergency": "poweroff",
        "rd.shell": "0",
        "ro": true,
        "root": "UUID=ea38fcc7-c4ec-43f4-a087-626a399be03a"
    },
    "ansible_date_time": {
        "date": "2022-04-27",
        "day": "27",
        "epoch": "1651032170",
        "epoch_int": "1651032170",
        "hour": "04",
        "iso8601": "2022-04-27T04:02:50Z",
        "iso8601_basic": "20220427T040250482692",
        "iso8601_basic_short": "20220427T040250",
        "iso8601_micro": "2022-04-27T04:02:50.482692Z",
        "minute": "02",
        "month": "04",
        "second": "50",
        "time": "04:02:50",
        "tz": "UTC",
        "tz_dst": "UTC",
        "tz_offset": "+0000",
        "weekday": "Wednesday",
        "weekday_number": "3",
        "weeknumber": "17",
        "year": "2022"
    },
    "ansible_default_ipv4": {
        "address": "10.0.9.88",
        "alias": "eth0",
        "broadcast": "10.0.15.255",
        "gateway": "10.0.0.1",
        "interface": "eth0",
        "macaddress": "0a:86:38:52:16:15",
        "mtu": 9001,
        "netmask": "255.255.240.0",
        "network": "10.0.0.0",
        "type": "ether"
    },
    "ansible_default_ipv6": {},
    "ansible_device_links": {
        "ids": {},
        "labels": {
            "xvda1": [
                "\\x2f"
            ]
        },
        "masters": {},
        "uuids": {
            "xvda1": [
                "ea38fcc7-c4ec-43f4-a087-626a399be03a"
            ]
        }
    },
    "ansible_devices": {
        "xvda": {
            "holders": [],
            "host": "",
            "links": {
                "ids": [],
                "labels": [],
                "masters": [],
                "uuids": []
            },
            "model": null,
            "partitions": {
                "xvda1": {
                    "holders": [],
                    "links": {
                        "ids": [],
                        "labels": [
                            "\\x2f"
                        ],
                        "masters": [],
                        "uuids": [
                            "ea38fcc7-c4ec-43f4-a087-626a399be03a"
                        ]
                    },
                    "sectors": "16773087",
                    "sectorsize": 512,
                    "size": "8.00 GB",
                    "start": "4096",
                    "uuid": "ea38fcc7-c4ec-43f4-a087-626a399be03a"
                }
            },
            "removable": "0",
            "rotational": "0",
            "sas_address": null,
            "sas_device_handle": null,
            "scheduler_mode": "mq-deadline",
            "sectors": "16777216",
            "sectorsize": "512",
            "size": "8.00 GB",
            "support_discard": "0",
            "vendor": null,
            "virtual": 1
        }
    },
    "ansible_distribution": "Amazon",
    "ansible_distribution_file_parsed": true,
    "ansible_distribution_file_path": "/etc/os-release",
    "ansible_distribution_file_variety": "Amazon",
    "ansible_distribution_major_version": "2",
    "ansible_distribution_minor_version": "NA",
    "ansible_distribution_release": "NA",
    "ansible_distribution_version": "2",
    "ansible_dns": {
        "nameservers": [
            "10.0.0.2"
        ],
        "options": {
            "attempts": "5",
            "timeout": "2"
        },
        "search": [
            "ec2.internal"
        ]
    },
    "ansible_domain": "ec2.internal",
    "ansible_effective_group_id": 1000,
    "ansible_effective_user_id": 1000,
    "ansible_env": {
        "HOME": "/home/ec2-user",
        "LANG": "en_US.UTF-8",
        "LESSOPEN": "||/usr/bin/lesspipe.sh %s",
        "LOGNAME": "ec2-user",
        "LS_COLORS": "rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:",
        "MAIL": "/var/mail/ec2-user",
        "PATH": "/usr/local/bin:/usr/bin",
        "PWD": "/home/ec2-user",
        "SHELL": "/bin/bash",
        "SHLVL": "2",
        "SSH_CLIENT": "67.10.103.79 58307 22",
        "SSH_CONNECTION": "67.10.103.79 58307 10.0.9.88 22",
        "SSH_TTY": "/dev/pts/0",
        "TERM": "xterm-256color",
        "USER": "ec2-user",
        "XDG_RUNTIME_DIR": "/run/user/1000",
        "XDG_SESSION_ID": "3",
        "_": "/usr/bin/python3.7"
    },
    "ansible_eth0": {
        "active": true,
        "device": "eth0",
        "features": {
            "esp_hw_offload": "off [fixed]",
            "esp_tx_csum_hw_offload": "off [fixed]",
            "fcoe_mtu": "off [fixed]",
            "generic_receive_offload": "on",
            "generic_segmentation_offload": "on",
            "highdma": "off [fixed]",
            "hw_tc_offload": "off [fixed]",
            "l2_fwd_offload": "off [fixed]",
            "large_receive_offload": "off [fixed]",
            "loopback": "off [fixed]",
            "macsec_hw_offload": "off [fixed]",
            "netns_local": "off [fixed]",
            "ntuple_filters": "off [fixed]",
            "receive_hashing": "off [fixed]",
            "rx_all": "off [fixed]",
            "rx_checksumming": "on [fixed]",
            "rx_fcs": "off [fixed]",
            "rx_gro_hw": "off [fixed]",
            "rx_gro_list": "off",
            "rx_udp_tunnel_port_offload": "off [fixed]",
            "rx_vlan_filter": "off [fixed]",
            "rx_vlan_offload": "off [fixed]",
            "rx_vlan_stag_filter": "off [fixed]",
            "rx_vlan_stag_hw_parse": "off [fixed]",
            "scatter_gather": "on",
            "tcp_segmentation_offload": "on",
            "tls_hw_record": "off [fixed]",
            "tls_hw_rx_offload": "off [fixed]",
            "tls_hw_tx_offload": "off [fixed]",
            "tx_checksum_fcoe_crc": "off [fixed]",
            "tx_checksum_ip_generic": "off [fixed]",
            "tx_checksum_ipv4": "on [fixed]",
            "tx_checksum_ipv6": "off [requested on]",
            "tx_checksum_sctp": "off [fixed]",
            "tx_checksumming": "on",
            "tx_esp_segmentation": "off [fixed]",
            "tx_fcoe_segmentation": "off [fixed]",
            "tx_gre_csum_segmentation": "off [fixed]",
            "tx_gre_segmentation": "off [fixed]",
            "tx_gso_list": "off [fixed]",
            "tx_gso_partial": "off [fixed]",
            "tx_gso_robust": "on [fixed]",
            "tx_ipxip4_segmentation": "off [fixed]",
            "tx_ipxip6_segmentation": "off [fixed]",
            "tx_lockless": "off [fixed]",
            "tx_nocache_copy": "off",
            "tx_scatter_gather": "on",
            "tx_scatter_gather_fraglist": "off [fixed]",
            "tx_sctp_segmentation": "off [fixed]",
            "tx_tcp6_segmentation": "off [requested on]",
            "tx_tcp_ecn_segmentation": "off [fixed]",
            "tx_tcp_mangleid_segmentation": "off",
            "tx_tcp_segmentation": "on",
            "tx_tunnel_remcsum_segmentation": "off [fixed]",
            "tx_udp_segmentation": "off [fixed]",
            "tx_udp_tnl_csum_segmentation": "off [fixed]",
            "tx_udp_tnl_segmentation": "off [fixed]",
            "tx_vlan_offload": "off [fixed]",
            "tx_vlan_stag_hw_insert": "off [fixed]",
            "udp_fragmentation_offload": "off",
            "vlan_challenged": "off [fixed]"
        },
        "hw_timestamp_filters": [],
        "ipv4": {
            "address": "10.0.9.88",
            "broadcast": "10.0.15.255",
            "netmask": "255.255.240.0",
            "network": "10.0.0.0"
        },
        "ipv6": [
            {
                "address": "fe80::886:38ff:fe52:1615",
                "prefix": "64",
                "scope": "link"
            }
        ],
        "macaddress": "0a:86:38:52:16:15",
        "module": "xen_netfront",
        "mtu": 9001,
        "pciid": "vif-0",
        "promisc": false,
        "timestamping": [
            "tx_software",
            "rx_software",
            "software"
        ],
        "type": "ether"
    },
    "ansible_fibre_channel_wwn": [],
    "ansible_fips": false,
    "ansible_form_factor": "Other",
    "ansible_fqdn": "ip-10-0-9-88.ec2.internal",
    "ansible_hostname": "ip-10-0-9-88",
    "ansible_hostnqn": "",
    "ansible_interfaces": [
        "lo",
        "eth0"
    ],
    "ansible_is_chroot": true,
    "ansible_iscsi_iqn": "",
    "ansible_kernel": "5.10.109-104.500.amzn2.x86_64",
    "ansible_kernel_version": "#1 SMP Wed Apr 13 20:31:43 UTC 2022",
    "ansible_lo": {
        "active": true,
        "device": "lo",
        "features": {
            "esp_hw_offload": "off [fixed]",
            "esp_tx_csum_hw_offload": "off [fixed]",
            "fcoe_mtu": "off [fixed]",
            "generic_receive_offload": "on",
            "generic_segmentation_offload": "on",
            "highdma": "on [fixed]",
            "hw_tc_offload": "off [fixed]",
            "l2_fwd_offload": "off [fixed]",
            "large_receive_offload": "off [fixed]",
            "loopback": "on [fixed]",
            "macsec_hw_offload": "off [fixed]",
            "netns_local": "on [fixed]",
            "ntuple_filters": "off [fixed]",
            "receive_hashing": "off [fixed]",
            "rx_all": "off [fixed]",
            "rx_checksumming": "on [fixed]",
            "rx_fcs": "off [fixed]",
            "rx_gro_hw": "off [fixed]",
            "rx_gro_list": "off",
            "rx_udp_tunnel_port_offload": "off [fixed]",
            "rx_vlan_filter": "off [fixed]",
            "rx_vlan_offload": "off [fixed]",
            "rx_vlan_stag_filter": "off [fixed]",
            "rx_vlan_stag_hw_parse": "off [fixed]",
            "scatter_gather": "on",
            "tcp_segmentation_offload": "on",
            "tls_hw_record": "off [fixed]",
            "tls_hw_rx_offload": "off [fixed]",
            "tls_hw_tx_offload": "off [fixed]",
            "tx_checksum_fcoe_crc": "off [fixed]",
            "tx_checksum_ip_generic": "on [fixed]",
            "tx_checksum_ipv4": "off [fixed]",
            "tx_checksum_ipv6": "off [fixed]",
            "tx_checksum_sctp": "on [fixed]",
            "tx_checksumming": "on",
            "tx_esp_segmentation": "off [fixed]",
            "tx_fcoe_segmentation": "off [fixed]",
            "tx_gre_csum_segmentation": "off [fixed]",
            "tx_gre_segmentation": "off [fixed]",
            "tx_gso_list": "off [fixed]",
            "tx_gso_partial": "off [fixed]",
            "tx_gso_robust": "off [fixed]",
            "tx_ipxip4_segmentation": "off [fixed]",
            "tx_ipxip6_segmentation": "off [fixed]",
            "tx_lockless": "on [fixed]",
            "tx_nocache_copy": "off [fixed]",
            "tx_scatter_gather": "on [fixed]",
            "tx_scatter_gather_fraglist": "on [fixed]",
            "tx_sctp_segmentation": "on",
            "tx_tcp6_segmentation": "on",
            "tx_tcp_ecn_segmentation": "on",
            "tx_tcp_mangleid_segmentation": "on",
            "tx_tcp_segmentation": "on",
            "tx_tunnel_remcsum_segmentation": "off [fixed]",
            "tx_udp_segmentation": "off [fixed]",
            "tx_udp_tnl_csum_segmentation": "off [fixed]",
            "tx_udp_tnl_segmentation": "off [fixed]",
            "tx_vlan_offload": "off [fixed]",
            "tx_vlan_stag_hw_insert": "off [fixed]",
            "udp_fragmentation_offload": "off",
            "vlan_challenged": "on [fixed]"
        },
        "hw_timestamp_filters": [],
        "ipv4": {
            "address": "127.0.0.1",
            "broadcast": "",
            "netmask": "255.0.0.0",
            "network": "127.0.0.0"
        },
        "ipv6": [
            {
                "address": "::1",
                "prefix": "128",
                "scope": "host"
            }
        ],
        "mtu": 65536,
        "promisc": false,
        "timestamping": [
            "tx_software",
            "rx_software",
            "software"
        ],
        "type": "loopback"
    },
    "ansible_local": {},
    "ansible_lsb": {},
    "ansible_machine": "x86_64",
    "ansible_machine_id": "ec241e799eaf2c0ee222f87da91ab53c",
    "ansible_memfree_mb": 370,
    "ansible_memory_mb": {
        "nocache": {
            "free": 846,
            "used": 118
        },
        "real": {
            "free": 370,
            "total": 964,
            "used": 594
        },
        "swap": {
            "cached": 0,
            "free": 0,
            "total": 0,
            "used": 0
        }
    },
    "ansible_memtotal_mb": 964,
    "ansible_mounts": [
        {
            "block_available": 1691049,
            "block_size": 4096,
            "block_total": 2094075,
            "block_used": 403026,
            "device": "/dev/xvda1",
            "fstype": "xfs",
            "inode_available": 4145305,
            "inode_total": 4193216,
            "inode_used": 47911,
            "mount": "/",
            "options": "rw,noatime,attr2,inode64,logbufs=8,logbsize=32k,noquota",
            "size_available": 6926536704,
            "size_total": 8577331200,
            "uuid": "ea38fcc7-c4ec-43f4-a087-626a399be03a"
        }
    ],
    "ansible_nodename": "ip-10-0-9-88.ec2.internal",
    "ansible_os_family": "RedHat",
    "ansible_pkg_mgr": "yum",
    "ansible_proc_cmdline": {
        "BOOT_IMAGE": "/boot/vmlinuz-5.10.109-104.500.amzn2.x86_64",
        "biosdevname": "0",
        "console": [
            "tty0",
            "ttyS0,115200n8"
        ],
        "net.ifnames": "0",
        "nvme_core.io_timeout": "4294967295",
        "rd.emergency": "poweroff",
        "rd.shell": "0",
        "ro": true,
        "root": "UUID=ea38fcc7-c4ec-43f4-a087-626a399be03a"
    },
    "ansible_processor": [
        "0",
        "GenuineIntel",
        "Intel(R) Xeon(R) CPU E5-2676 v3 @ 2.40GHz"
    ],
    "ansible_processor_cores": 1,
    "ansible_processor_count": 1,
    "ansible_processor_nproc": 1,
    "ansible_processor_threads_per_core": 1,
    "ansible_processor_vcpus": 1,
    "ansible_product_name": "HVM domU",
    "ansible_product_serial": "NA",
    "ansible_product_uuid": "NA",
    "ansible_product_version": "4.2.amazon",
    "ansible_python": {
        "executable": "/usr/bin/python3.7",
        "has_sslcontext": true,
        "type": "cpython",
        "version": {
            "major": 3,
            "micro": 10,
            "minor": 7,
            "releaselevel": "final",
            "serial": 0
        },
        "version_info": [
            3,
            7,
            10,
            "final",
            0
        ]
    },
    "ansible_python_version": "3.7.10",
    "ansible_real_group_id": 1000,
    "ansible_real_user_id": 1000,
    "ansible_selinux": {
        "status": "disabled"
    },
    "ansible_selinux_python_present": true,
    "ansible_service_mgr": "systemd",
    "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBBDmdCyIAG7Em3gplEI9i4NJUF5sbSswl+/rorO472UIohlShzFz3BLUW2D1pxdf2rxwC6oMebbEv9pB78Z+zZQ=",
    "ansible_ssh_host_key_ecdsa_public_keytype": "ecdsa-sha2-nistp256",
    "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIMraBCvtmc77SNP9ZNhMgdfLiqD+ikrURY8hgHBoKRqH",
    "ansible_ssh_host_key_ed25519_public_keytype": "ssh-ed25519",
    "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABAQC4YHiv5A+jB8U8xiwyq9NsBX7hOLw0ijkLOzSwKdAK2SVW2D3vlBBzEIQwTU2UJD4ArRDx+a/Ubw/Egs6Kd6QtG+qTTOG/xGa1+XRk8M5XHvp9HDnBv0gFFj0WrvALMfWxdKGU/xQPRLBskSdAf7JuyjDzWXmn1BqSPClDaHSa9A0Ij/DiJT0e3kCYBnxZ+EUmTy+Pm84NNUOhPLEnsIbNVNU9TXtf3cHSlMt86dFD4ebqI5yds8kz69U/ziK41TklsZO7Pb+WzUhHnzE3zRDioP5gaz8wUr7cv4Pydmhp4gksyJP2SGljmrNgHErX7GtIduy28u1GwHQ+ohXhb7Th",
    "ansible_ssh_host_key_rsa_public_keytype": "ssh-rsa",
    "ansible_swapfree_mb": 0,
    "ansible_swaptotal_mb": 0,
    "ansible_system": "Linux",
    "ansible_system_capabilities": [
        ""
    ],
    "ansible_system_capabilities_enforced": "True",
    "ansible_system_vendor": "Xen",
    "ansible_uptime_seconds": 393,
    "ansible_user_dir": "/home/ec2-user",
    "ansible_user_gecos": "EC2 Default User",
    "ansible_user_gid": 1000,
    "ansible_user_id": "ec2-user",
    "ansible_user_shell": "/bin/bash",
    "ansible_user_uid": 1000,
    "ansible_userspace_architecture": "x86_64",
    "ansible_userspace_bits": "64",
    "ansible_virtualization_role": "guest",
    "ansible_virtualization_tech_guest": [
        "xen"
    ],
    "ansible_virtualization_tech_host": [],
    "ansible_virtualization_type": "xen",
    "discovered_interpreter_python": "/usr/bin/python3.7",
    "gather_subset": [
        "all"
    ],
    "module_setup": true
}