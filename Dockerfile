ARG BASE_IMAGE=archlinux
FROM $BASE_IMAGE

RUN rm -f $(ls -d /lib/systemd/system/sysinit.target.wants/* | grep -v systemd-tmpfiles-setup) \
	/etc/systemd/system/*.wants/* \
	/lib/systemd/system/anaconda.target.wants/* \
	/lib/systemd/system/basic.target.wants/* \
	/lib/systemd/system/local-fs.target.wants/* \
	/lib/systemd/system/multi-user.target.wants/* \
	/lib/systemd/system/plymouth* \
	/lib/systemd/system/sockets.target.wants/*initctl* \
	/lib/systemd/system/sockets.target.wants/*udev* \
	/lib/systemd/system/systemd-update-utmp*

VOLUME ["/sys/fs/cgroup"]

CMD ["/lib/systemd/systemd"]
