PROGRAMS=motds32
CONFIGS=motds32.conf


usage:
	@echo "This makefile allows you to:"
	@echo "  o install MOTDstat"
	@echo "  o unintall MOTDstat"
	@echo
	@echo Examples:
	@echo "  make install"
	@echo "  make uninstall"


install: 
	for prog in $(PROGRAMS); do \
		install -m 0755 bin/$$prog /usr/bin; \
	done

	if test ! -d /etc/motds32; then mkdir -p /etc/motds32; touch /etc/motds32/Stats32.txt; chmod 777 /etc/motds32/Stats32.txt; fi
	for config in $(CONFIGS); do \
		if test ! -e /etc/motds32/$$config; then install -m 644 ./etc/motds32/$$config /etc/motds32; fi \
	done
	

uninstall:
	for prog in $(PROGRAMS); do \
		rm -f /usr/bin/$$prog; \
	done
	rm -rf /etc/motds32/ /etc/motd.full
	mv -f /etc/motd.orig /etc/motd
