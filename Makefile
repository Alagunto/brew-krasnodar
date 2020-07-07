build_snowboy:
	cd snowboy/swig/Python3 && make; \
	cp _snowboydetect.so ../../../; \
	cp snowboy-* ../../../; \
	cp snowboydetect.py ../../../;

install: build_snowboy
	mkdir -p ${PREFIX}/bin;  \
	printf "#!/bin/bash\n${PREFIX}/libexec/bin/python ${PREFIX}/" > ${PREFIX}/bin/krasnodar; \
