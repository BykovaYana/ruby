FROM ruby:2.7.1

ARG CHROME_DRIVER_VERSION=81.0.4044.69

RUN apt-get update \
&& apt-get install -y libgbm1 \
  && apt-get install libxi6 \
  libnss3 \
  libgconf-2-4 \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libgtk-3-0 \
  libx11-xcb1 \
  libxss1 \
  lsb-release \
  xdg-utils \
  libxcomposite1 -y

RUN apt-get update

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb

RUN wget -N https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/
RUN unzip ~/chromedriver_linux64.zip -d ~/
RUN rm ~/chromedriver_linux64.zip
RUN mv -f ~/chromedriver /usr/local/bin/chromedriver
RUN chmod 0755 /usr/local/bin/chromedriver

RUN mkdir /usr/src/app && mkdir /usr/src/app/output
WORKDIR /usr/src/app
COPY . .
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5
EXPOSE 8080

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
