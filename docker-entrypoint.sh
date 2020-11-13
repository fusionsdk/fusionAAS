#!/bin/bash


parameterCheck() {
	[ -z "${MYSQL_DATABASE}" ] && echo "env MYSQL_DATABASE set, please set it in .env file and try again." && exit 1
	[ -z "${MYSQL_USER}" ] && echo "env MYSQL_USER not set, please set it in .env file and try again." && exit 1
	[ -z "${MYSQL_PASSWORD}" ] && echo "env MYSQL_PASSWORD not set, please set it in .env file and try again." && exit 1
	[ -z "${MYSQL_SERVICE_NAME}" ] && echo "env MYSQL_SERVICE_NAME not set, please set it in .env file and try again." && exit 1
	[ -z "${FUSIONAAS_PATH}" ] && echo "env FUSIONAAS_PATH not set, it will be set to default '/var/www/fusionaas' ."
	export FUSIONAAS_PATH=/var/www/fusionaas
}

genDBConf() {
	DBConfTemplateFile=${FUSIONAAS_PATH}/data/config/database.php-sample
	DBConfFile=${FUSIONAAS_PATH}/data/config/database.php
	cp ${DBConfTemplateFile} ${DBConfFile}

	sed -i "s|'hostname' => '127.0.0.1'|'hostname' => '${MYSQL_SERVICE_NAME}'|g" ${DBConfFile}
	sed -i "s|'database' => 'fsdk_aas'|'database' => '${MYSQL_DATABASE}'|g" ${DBConfFile}
	sed -i "s|'username' => 'root'|'username' => '${MYSQL_USER}'|g" ${DBConfFile}
	sed -i "s|'password' => '',|'password' => '${MYSQL_PASSWORD}',|g" ${DBConfFile}
}

genDBTables() {
	tablesCnt=`mysql -h${MYSQL_SERVICE_NAME} -u${MYSQL_USER} -p${MYSQL_PASSWORD} -Ne 'SELECT COUNT(DISTINCT table_name) FROM information_schema.columns WHERE table_schema = "${MYSQL_DATABASE}"'`
	initDBSQLFile=${FUSIONAAS_PATH}/sql/fsdk_aas.sql

	if [[ $tablesCnt -eq 0 ]]; then
		mysql -h${MYSQL_SERVICE_NAME} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ${initDBSQLFile}
	fi
}

setTimeZone() {
	if [ -z "${TZ}" ]; then
		if [ -f "/usr/share/zoneinfo/${TZ}" ]; then
			rm /etc/localtime
			ln -s /usr/share/zoneinfo/${TZ} /etc/localtime
		fi
	fi
}

copyCode() {
	src=/app/.
	dst=${FUSIONAAS_PATH}


	if [ ! -d "${FUSIONAAS_PATH}" ]; then
		mkdir -p ${FUSIONAAS_PATH}
	fi

	cp -ra ${src} ${dst}

	chown -R www-data:www-data ${dst}
}

echo "Sleep 10 seconds wait for mysql start"
sleep 10

parameterCheck
setTimeZone
copyCode
genDBConf
genDBTables

php-fpm
