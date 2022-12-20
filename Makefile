SRC=src
RUN=docker run -it --rm -v $(PWD):/code -v $(PWD)/src:/src 

jupyter-m: 
	@ $(RUN) -p 8895:8895 mistat.m.jupyter jupyter notebook --allow-root --port=8895 --ip 0.0.0.0 --no-browser

bash-m:
	@ $(RUN) mistat.m.python  bash

# tests:
# 	@ $(RUN) super.python pytest -p no:cacheprovider

# watch-tests:
# 	rm -f .testmondata
# 	@ $(RUN) supersar.python ptw --runner "pytest -o cache_dir=/tmp --testmon --quiet -rP"


# Docker container
images:
	docker build -t mistat.m.python -f docker/Dockerfile.m.python .
	docker build -t mistat.m.jupyter -f docker/Dockerfile.m.jupyter .
