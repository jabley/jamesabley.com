.PHONY: images

images: png

png:
	dot -Tpng -o images/dachs/serial.png doc/dachs/serial.dot
	dot -Tpng -o images/dachs/parallel.png doc/dachs/parallel.dot
	dot -Tpng -o images/dachs/multiple-zones.png doc/dachs/multiple-zones.dot
