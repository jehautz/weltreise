build: package.json index.html assets/
	docker build -t weltreise .

start: build
	docker run --rm -d -p 21213:80 --name lndfweltreise weltreise

stop:
	-docker stop lndfweltreise
