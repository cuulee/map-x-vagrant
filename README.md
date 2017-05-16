# MAP-X LXC container

Set up a LXC container for map-x

1. install [vagrant-lxc](https://github.com/fgrehm/vagrant-lxc)
2. type ```git clone https://github.com/fxi/map-x-vagrant-lxc map-x-vagrant-lxc && cd "$_"```
3. fill up config/credentials/credentials.sh 
4. type ```vagrant up```


## Structure

```sh

.
├── README.md 
├── Vagrantfile [ Vagrant configuration file ]
├── config [ hold configuration files ]
│   ├── credentials 
│   │   ├── credentials.sh [ passwords and email settings ]
│   │   └── credentials.sh.template
│   ├── nginx [ internal nginx and map-x settings ]
│   │   ├── mapx.conf
│   │   └── nginx.conf
│   ├── postgres 
│   │   ├── crypto.sql [ encryption functions used in map-x ]
│   │   └── tables.sql [ minimal map-x table]
│   └── shiny
│       └── shiny-server.conf [ shiny server configuration ]
├── data [ hold generated data ]
│   ├── passwords [ hold generated password files if no password provieded in credentials.sh ]
│   ├── postgres [ if mapx.sql dump is present here, import it ]
│   ├── receipts [ empty files corresponding to each script. If nothing, every steps will be executed ]
│   └── userdata [ could be used to store map-x user data. ]
└── scripts [ script to execute. The main file is install.sh ]
    ├── backup-mapx-db.sh
    ├── helper.sh
    ├── install.sh
    ├── part_apt_depedencies.sh
    ├── part_apt_sources.sh
    ├── part_gdal.sh
    ├── part_gist.sh
    ├── part_mapx.sh
    ├── part_mapx_landing.sh
    ├── part_nginx_config.sh
    ├── part_node_manager.sh
    ├── part_pm2.sh
    ├── part_postfix.sh
    ├── part_postgres_import_dump.sh
    ├── part_postgres_init.sh
    ├── part_postgres_init_tables.sh
    ├── part_postgres_set_pwd.sh
    ├── part_r_packages.sh
    ├── part_shiny_server.sh
    ├── part_shiny_server_config.sh
    ├── part_vt.sh
    └── prepare.sh

```



