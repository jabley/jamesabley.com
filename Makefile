.PHONY: images

images: png copy-images

png:
	dot -Tpng -o doc/dachs/serial.png doc/dachs/serial.dot
	dot -Tpng -o doc/dachs/parallel.png doc/dachs/parallel.dot
	dot -Tpng -o doc/dachs/multiple-zones.png doc/dachs/multiple-zones.dot

copy-images:
	mv doc/dachs/*.png images/dachs/
