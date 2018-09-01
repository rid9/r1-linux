#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/glibc/glibc-2.27.tar.xz"
    "http://www.linuxfromscratch.org/patches/lfs/8.2/glibc-2.27-fhs-1.patch"
    "http://www.iana.org/time-zones/repository/releases/tzdata2018c.tar.gz"
)

COMMANDS+=(adjust)

COMMAND_HELP["adjust"]="Adjusts toolchain to remove /tools dependency"

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/glibc-2.27-fhs-1.patch"
}

cmd_configure() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    [ -d /tools ] && $SUDO ln -sfv /tools/lib/gcc /usr/lib &&

    case $(uname -m) in
        i?86)    GCC_INCDIR=/usr/lib/gcc/$(uname -m)-pc-linux-gnu/7.3.0/include
                $SUDO ln -sfv ld-linux.so.2 /lib/ld-lsb.so.3
        ;;
        x86_64) GCC_INCDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/include
                $SUDO ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64 &&
                $SUDO ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3
        ;;
    esac &&

    $SUDO rm -f /usr/include/limits.h &&

    mkdir -v build &&
    cd build &&

    CC="gcc -isystem $GCC_INCDIR -isystem /usr/include" \
    ../configure --prefix=/usr \
                 --disable-werror \
                 --enable-kernel=3.2 \
                 --enable-stack-protector=strong \
                 libc_cv_slibdir=/lib &&
    unset GCC_INCDIR
}

cmd_make() {
    cmd_configure &&
    cd "${SOURCE_WORK_DIR}/build" &&
    make
}

install_ld_conf() {
    $SUDO bash -c "cat ${CONFIG_DIR}/ld.so.conf > /etc/ld.so.conf"
}

install_nscd_conf() {
    $SUDO cp -v ../nscd/nscd.conf /etc/nscd.conf &&
    $SUDO mkdir -pv /var/cache/nscd
}

install_nsswitch_conf() {
    $SUDO bash -c "cat ${CONFIG_DIR}/nsswitch.conf > /etc/nsswitch.conf"
}

install_locales() {
    $SUDO mkdir -pv /usr/lib/locale &&
    $SUDO localedef -i en_US -f ISO-8859-1 en_US &&
    $SUDO localedef -i en_US -f UTF-8 en_US.UTF-8
}

install_tzdata() {
    tar -xf "${SOURCES_DIR}/tzdata2018c.tar.gz" &&

    ZONEINFO=/usr/share/zoneinfo &&
    $SUDO mkdir -pv ${ZONEINFO}/{posix,right} &&
    
    for tz in etcetera southamerica northamerica europe africa antarctica  \
              asia australasia backward pacificnew systemv; do
        $SUDO zic -L /dev/null   -d ${ZONEINFO}       -y "sh yearistype.sh" ${tz} &&
        $SUDO zic -L /dev/null   -d ${ZONEINFO}/posix -y "sh yearistype.sh" ${tz} &&
        $SUDO zic -L leapseconds -d ${ZONEINFO}/right -y "sh yearistype.sh" ${tz}
    done
    
    $SUDO cp -v zone.tab zone1970.tab iso3166.tab ${ZONEINFO} &&
    $SUDO zic -d ${ZONEINFO} -p America/New_York &&
    unset ZONEINFO
}

cmd_install() {
    TIMEZONE=$1

    if [ -z "${TIMEZONE}" ]; then
        echo "no timezone specified" >&2
        exit 1
    fi

    cmd_make &&
    cd "${SOURCE_WORK_DIR}/build" &&

    install_ld_conf &&
    
    sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile &&
    make install &&

    install_nscd_conf &&
    install_nsswitch_conf &&
    install_locales &&

    install_tzdata &&
    $SUDO cp -v "/usr/share/zoneinfo/${TIMEZONE}" /etc/localtime
}

cmd_adjust() {
    $SUDO mv -v /tools/bin/{ld,ld-old} &&
    $SUDO mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old} &&
    $SUDO mv -v /tools/bin/{ld-new,ld} &&
    $SUDO ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld &&

    gcc -dumpspecs | sed \
        -e 's@/tools@@g' \
        -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
        -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' > \
        `dirname $(gcc --print-libgcc-file-name)`/specs
}
