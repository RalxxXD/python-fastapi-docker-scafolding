run:
	uvicorn main:main --reload

swagger:
	python -m webbrowser "http://127.0.0.1:8000/docs"

test:
	pytest --cov=./ --cov-fail-under=50

build:
	docker build .

run-docker:
	docker-compose up --build

stop-docker:
	docker stop $$(docker ps -q) || true

lint:
	find . -type f -not -path "*.venv"/* -not -path "*venv/*" -name "*.py" | xargs pylint -j 4 --rcfile=.pylintrc --output-format=colorized || \
		pylint-exit --error- --warn-fail --refactor-fail --convention-fail $$? || true