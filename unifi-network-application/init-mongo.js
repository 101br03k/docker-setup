db.getSiblingDB("unifi").createUser({user: "adm-aw", pwd: "UI-5nHgg3G0cH9d", roles: [{role: "dbOwner", db: "unifi"}]});
db.getSiblingDB("unifi_stat").createUser({user: "adm-aw", pwd: "UI-5nHgg3G0cH9d", roles: [{role: "dbOwner", db: "unifi_stat"}]});
