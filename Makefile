BUILD = build

bootstrap:
	npm install -g @asyncapi/generator

all: node docs

node:
	ag asyncapi.yaml @asyncapi/nodejs-template -o ${BUILD}/node -p server=mosquitto
	cd ${BUILD}/node; npm install

docs:
	ag --force-write asyncapi.yaml @asyncapi/html-template -o docs

clean:
	rm -dfr ${BUILD}

run:
	cd ${BUILD}/node; npm start

.PHONY: clean