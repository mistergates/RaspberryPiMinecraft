#!/bin/sh
FTP_FOLDER=ftp://readyshare.routerlogin.net/backups/
BACKUP_FILE=backups/$(date +%Y.%m.%d.%H.%M.%S).tar.gz

cd dirname/minecraft/

echo "Backing up server to $BACKUP_FILE"
tar --exclude='./backups' --exclude='./cache' --exclude='./logs' --exclude='./paperclip.jar' -pzcf $BACKUP_FILE ./*
echo "Uploading backup to $FTP_FOLDER"
curl -s --disable-epsv -T $BACKUP_FILE $FTP_FOLDER
echo "Removing backups from local disk"
rm -rf $BACKUP_FILE
