PREFIX=/usr/local
bindir=$(PREFIX)/bin
unitdir=/etc/systemd/system

SCRIPTS = \
	  update-r53

SERVICES = \
	update-r53@.service

TIMERS = \
	 update-r53@.timer

UNITS = \
	$(SERVICES) \
	$(TIMERS)

all:

install: install-scripts install-units

install-scripts:
	for script in $(SCRIPTS); do \
		install -m 755 $$script $(bindir); \
	done

install-units: install-services install-timers

install-services:
	for unit in $(SERVICES); do \
		install -m 644 $$unit $(unitdir); \
	done

install-timers:
	for unit in $(TIMERS); do \
		install -m 644 $$unit $(unitdir); \
	done

reload:
	systemctl daemon-reload
