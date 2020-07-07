install:
	mkdir -p ${PREFIX}/bin;  \
	printf "#!/bin/bash\n${PREFIX}/libexec/bin/python ${PREFIX}/" > ${PREFIX}/bin/krasnodar.sh; \
	chmod a+x ${PREFIX}/bin/krasnodar.sh;