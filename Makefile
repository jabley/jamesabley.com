.PHONY: images

images: -graphviz

-graphviz:
	dot -Tsvg -o images/dachs/serial.svg doc/dachs/serial.dot
	dot -Tsvg -o images/dachs/parallel.svg doc/dachs/parallel.dot
	dot -Tsvg -o images/dachs/multiple-zones.svg doc/dachs/multiple-zones.dot
