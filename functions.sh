#!/bin/bash

COMMANDS=(clean clean_sources clean_work configure download extract install make size uninstall)

declare -A COMMAND_HELP=(
    ["clean"]="Removes all package files."
    ["clean_sources"]="Removes downloaded sources."
    ["clean_work"]="Removes extracted packages."
	["configure"]="Configures the build."
    ["download"]="Downloads sources."
    ["extract"]="Extracts sources."
	["install_doc"]="Installs additional documentation."
	["install"]="Installs the package."
	["make"]="Builds the package."
    ["size"]="Display package size."
    ["uninstall_doc"]="Uninstalls additional documentation."
    ["uninstall"]="Uninstalls the package."
)

remove_extensions() {
    sed 's/\.\(src\.\)\?\(tar\..*\|tgz\|zip\)$//'
}

check_deps() {
    init &&

    MISSING_DEPS=() &&

    for DEP in ${DEPS[@]}; do
        DEP_PATH="${ROOT_DIR}/${DEP}/files"
        if ! [ -e "${DEP_PATH}" ]; then
            MISSING_DEPS+=("${DEP}")
        fi
    done &&

    if [ "${#MISSING_DEPS}" -gt 0 ]; then
        echo "missing dependencies: ${MISSING_DEPS[@]}" >&2
        exit 1
    fi
}

after_init() {
    echo -n
}

init() {
    PKG_NAME=$(basename $PKG_DIR)
    TEMP_WORK=${TEMP_WORK:=1}

    SNAPSHOT_DIRS=${SNAPSHOT_DIRS:="/bin /etc /lib /lib64 /opt /sbin /srv /usr /var"}
    SNAPSHOT_OUTPUT=${SNAPSHOT_OUTPUT:="${PKG_DIR}/files"}
    SNAPSHOT_BEFORE_FILE=${SNAPSHOT_BEFORE_FILE:="${PKG_DIR}/snapshot_before.log"}
    SNAPSHOT_AFTER_FILE=${SNAPSHOT_AFTER_FILE:="${PKG_DIR}/snapshot_after.log"}

    MAIN_SOURCE_FILE=${MAIN_SOURCE_FILE:="$(basename "${SOURCE_URLS[0]}")"}
    MAIN_SOURCE_DIR=${MAIN_SOURCE_DIR:="$(echo "${MAIN_SOURCE_FILE}" | remove_extensions)"}

    ROOT_DIR=$(realpath "${BASH_SOURCE[0]%/*}")

    if [ "${TEMP_WORK}" == "1" ]; then
        SOURCES_DIR=${SOURCES_DIR:="/run/pkg/${PKG_NAME}/sources"}
        WORK_DIR=${WORK_DIR:="/run/pkg/${PKG_NAME}/work"}
    else
        SOURCES_DIR=${SOURCES_DIR:="${PKG_DIR}/sources"}
        WORK_DIR=${WORK_DIR:="${PKG_DIR}/work"}
    fi

    SOURCE_WORK_DIR=${SOURCE_WORK_DIR:="${WORK_DIR}/${MAIN_SOURCE_DIR}"}
    BUILD_DIR=${BUILD_DIR:="."}
	CONFIG_DIR=${CONFIG_DIR:="${PKG_DIR}/config"}

    CONFIGURE_FLAGS=("--prefix=/usr")
    SUDO_CMD="sudo"
    SUDO_FLAGS=("-S")
    SUDO="${SUDO_CMD} ${SUDO_FLAGS[@]}"

    after_init
}

make_sources_dir() {
    if ! [ -d "${SOURCES_DIR}" ]; then
        mkdir -pv "${SOURCES_DIR}"
    fi
}

run_download() {
    wget $*
}

cmd_download() {
    init &&

    make_sources_dir &&
    cd "${SOURCES_DIR}" &&

    for URL in "${SOURCE_URLS[@]}"; do
        FILE=$(basename ${URL}) &&
        if ! [ -e "${FILE}" ]; then
            echo "downloading ${FILE}..." &&
            run_download ${URL}
        fi
    done
}

before_extract() {
    echo -n
}

after_extract() {
    echo -n
}

run_extract() {
    if [ "$(echo $* | grep '\.zip$' | wc -l)" -eq 1 ]; then
        echo unzip $* -d "${MAIN_SOURCE_DIR}"
        unzip $* -d "${MAIN_SOURCE_DIR}"
    else
        tar xf $*
    fi
}

cmd_extract() {
    init &&

    if [ "$(has_command download)" -eq 1 ]; then
		cmd_download
	fi &&

    if ! [ -d "${WORK_DIR}" ]; then
        mkdir -pv "${WORK_DIR}"
    fi &&

    if ! [ -d "${SOURCE_WORK_DIR}" ]; then
        cd "${WORK_DIR}" &&
        before_extract &&
        echo "extracting ${MAIN_SOURCE_FILE}..." &&
        run_extract "${SOURCES_DIR}/${MAIN_SOURCE_FILE}" &&
        after_extract
    fi
}

snapshot_begin() {
    init &&
    echo "beginnig snapshot..." &&
    find ${SNAPSHOT_DIRS} > "${SNAPSHOT_BEFORE_FILE}" 2>/dev/null
}

snapshot_end() {
    init &&
    echo "ending snapshot..." &&
    find ${SNAPSHOT_DIRS} > "${SNAPSHOT_AFTER_FILE}" 2>/dev/null
}

snapshot_save() {
    diff \
        --color=never \
        --unchanged-line-format='' \
        --old-line-format='- %L' \
        --new-line-format='+ %L' \
        \
        "${SNAPSHOT_BEFORE_FILE}" \
        "${SNAPSHOT_AFTER_FILE}" >> ${SNAPSHOT_OUTPUT}

    if [ "$?" -lt 2 ]; then
        rm -f "${SNAPSHOT_BEFORE_FILE}" "${SNAPSHOT_AFTER_FILE}"
        return 0
    fi

    return $?
}

has_command() {
    for COMMAND in ${COMMANDS[@]}; do
        if [ "${COMMAND}" == "$1" ]; then
            echo 1
            return
        fi
    done

    echo 0
}

show_usage() {
    echo usage: $(basename ${BASH_SOURCE[2]}) "<command>"
    echo
    echo commands:

    IFS=$'\n' SORTED_COMMANDS=($(sort <<<"${COMMANDS[*]}"))
    unset IFS

    LONGEST=0
    for COMMAND in ${SORTED_COMMANDS[@]}; do
        LENGTH=${#COMMAND}
        if [ "${LENGTH}" -gt "${LONGEST}" ]; then
            LONGEST="${LENGTH}"
        fi
    done

    for COMMAND in ${SORTED_COMMANDS[@]}; do
        printf "  %-${LONGEST}s" "${COMMAND}"
        HELP="${COMMAND_HELP[${COMMAND}]}"
        if [ -z "${HELP}" ]; then
            echo
        else
            echo "  ${HELP}"
        fi
    done
}

cmd_uninstall() {
    init &&
    $SUDO bash -c '
        sed "s/^..//" '${SNAPSHOT_OUTPUT}' |
        xargs -d "\n" rm -rfv
    ' &&
    rm -f "${SNAPSHOT_OUTPUT}"
}

cmd_uninstall_doc() {
    cmd_uninstall
}

cmd_clean_sources() {
    init &&
    echo "removing ${SOURCES_DIR}..." &&
    rm -rf "${SOURCES_DIR}"
}

cmd_clean_work() {
    init &&
    echo "removing ${WORK_DIR}..." &&
    rm -rf "${WORK_DIR}"
}

cmd_clean() {
    cmd_clean_sources &&
    cmd_clean_work
}

cmd_size() {
    init

    if [ -d "${SOURCES_DIR}" ]; then
        echo sources = $(du -sh "${SOURCES_DIR}" | cut -f1)
    fi

    if [ -d "${WORK_DIR}" ]; then
        echo work = $(du -sh "${WORK_DIR}" | cut -f1)
    fi


    FILES=()
    for FILE in ${PKG_DIR}/files*; do
        if [ -e "${FILE}" ]; then
            FILES+=(${FILE})
        fi
    done

    if [ "${#FILES}" -gt 0 ]; then
        echo installed = $(
            cat ${FILES[@]} |
            grep '^+' |
            sed 's/^..//' |
            xargs -d "\n" du -shc |
            tail -n1 |
            cut -f1
        )
    fi
}

before_configure() {
    echo -n
}

after_configure() {
    echo -n
}

run_configure() {
    $*
}

cmd_configure() {
    if [ "$(has_command extract)" -eq 1 ]; then
		cmd_extract
	fi &&

    cd "${SOURCE_WORK_DIR}" &&
    before_configure &&

    if ! [ -d "${BUILD_DIR}" ]; then
        mkdir "${BUILD_DIR}"
    fi &&

    if [ -z "${CONFIGURE}" ]; then
        if [ "${BUILD_DIR}" == "." ]; then
            CONFIGURE="./configure"
        else
            CONFIGURE="../configure"
        fi
    fi &&

    cd "${BUILD_DIR}" &&
    run_configure ${CONFIGURE} ${CONFIGURE_FLAGS[@]} &&
    after_configure
}

before_make() {
    echo -n
}

after_make() {
    echo -n
}

run_make() {
    $*
}

cmd_make() {
    if [ "$(has_command configure)" -eq 1 ]; then
        cmd_configure
    else
		if [ "$(has_command extract)" -eq 1 ]; then
			cmd_extract
		fi &&
        cd "${SOURCE_WORK_DIR}"
    fi &&

    before_make &&
    run_make make &&
    after_make
}

before_install() {
    echo -n
}

after_install() {
    echo -n
}

run_install() {
    $SUDO $*
}

cmd_install() {
    if [ "$(has_command make)" -eq 1 ]; then
        cmd_make
    elif [ "$(has_command configure)" -eq 1 ]; then
        cmd_configure
    elif [ "$(has_command extract)" -eq 1 ]; then
        cmd_extract
    else
        if [ "$(has_command download)" -eq 1 ]; then
            cmd_download
		fi &&
        cd "${SOURCE_WORK_DIR}"
    fi &&

    before_install &&
    run_install make install &&
    after_install
}

remove_default_install() {
    init

    COMMANDS=("${COMMANDS[@]/uninstall/}")
    COMMANDS=("${COMMANDS[@]/install/}")
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

run_command() {
    COMMAND="cmd_$1"

    if [[ "${COMMAND}" == cmd_*_doc ]]; then
        SNAPSHOT_OUTPUT="${PKG_DIR}/files_doc"
    fi

    if [[ "${COMMAND}" == *configure* || "${COMMAND}" == *make* || "${COMMAND}" == *install* ]]; then
        if [[ "${COMMAND}" != cmd_uninstall ]]; then
            check_deps
        fi
    fi

    if [[ "${COMMAND}" == cmd_install* ]]; then
        snapshot_begin
        ${COMMAND} ${@:2}
        snapshot_end
        snapshot_save
    else
        ${COMMAND} ${@:2}
    fi
}

before_run() {
    echo -n
}

run() {
	ARGS=()
	for (( i=${#BASH_ARGV[@]}-1 ; i>=0 ; i-- )); do
		ARGS+=("${BASH_ARGV[i]}")
	done

	COMMAND="${ARGS[0]}"

    before_run &&

    if [ -z "${COMMAND}" ]; then
        show_usage && exit 1
    else
        if [ "$(has_command ${COMMAND})" -eq 1 ]; then
            run_command ${COMMAND} ${ARGS[@]:1}
        else
            echo "unknown command: ${COMMAND}"
            echo
            show_usage && exit 1
        fi
    fi
}

trap run EXIT
