IF EXIST C:\Users\Akash Khobare\Installers_Repo (
	echo The installer already exists.
	exit 0
) ELSE (
	mkdir C:\Users\Akash Khobare\Installers_Repo\${INSTALLER_NAME}
)