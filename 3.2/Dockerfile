# vim:set ft=dockerfile:

# Do not edit individual Dockerfiles manually. Instead, please make changes to the Dockerfile.template, which will be used by the build script to generate Dockerfiles.

FROM cimg/base:2022.04

LABEL maintainer="Community & Partner Engineering Team <community-partner@circleci.com>"

ENV RUBY_VERSION=3.2.0-preview3 \
	RUBY_MAJOR=3.2
# SHA256=c041d1488e62730d3a10dbe7cf7a3b3e4268dc867ec20ec991e7d16146640487

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
		autoconf \
		bison \
		dpkg-dev \
		# Rails dep
		ffmpeg \
		# until the base image has it
		libcurl4-openssl-dev \
		libffi-dev \
		libgdbm6 \
		libgdbm-dev \
		# Rails dep
		libmysqlclient-dev \
		libncurses5-dev \
		# Rails dep
		libpq-dev \
		libreadline6-dev \
		# install libsqlite3-dev until the base image has it
		# Rails dep
		libsqlite3-dev \
		libssl-dev \
		# Rails dep
		libxml2-dev \
		libyaml-dev \
		# Rails dep
		memcached \
		# Rails dep
		mupdf \
		# Rails dep
		mupdf-tools \
		# Rails dep
		imagemagick \
		# Rails dep
		sqlite3 \
		zlib1g-dev \
		ruby \
	&& \
	# Skip installing gem docs
	echo "gem: --no-document" > ~/.gemrc && \
	mkdir -p ~/ruby && \
	downloadURL="https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR}/ruby-$RUBY_VERSION.tar.gz" && \
	curl -sSL $downloadURL | tar -xz -C ~/ruby --strip-components=1 && \
	cd ~/ruby && \
	autoconf && \
	./configure --enable-shared && \
	make -j "$(nproc)" && \
	sudo make install && \
	mkdir ~/.rubygems && \
	sudo apt-get -y remove ruby && \
	sudo rm -rf ~/ruby /var/lib/apt/lists/* && \
	cd && \

	ruby --version && \
	gem --version && \
	sudo gem update --system && \
	gem --version && \
	bundle --version

ENV GEM_HOME /home/circleci/.rubygems
ENV PATH $GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH
