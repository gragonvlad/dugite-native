echo " -- Building git at $SOURCE to $DESTINATION"
apt-get update
apt-get install -y build-essential libexpat-dev libcurl4-openssl-dev zlib1g-dev libssl-dev

cd $SOURCE
make clean
DESTDIR="$DESTINATION" make strip install prefix=/ \
    NO_PERL=1 \
    NO_TCLTK=1 \
    NO_GETTEXT=1 \
    NO_INSTALL_HARDLINKS=1 \
    CC='gcc' \
    CFLAGS='-Wall -g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -U_FORTIFY_SOURCE' \
    LDFLAGS='-Wl,-Bsymbolic-functions -Wl,-z,relro'
